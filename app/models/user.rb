class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  #:confirmable,
  :omniauthable

  has_many :images, :as => :parent, :dependent => :destroy

  # Setup accessible (or protected) attributes for your model
  attr_accessible :access_token, :email, :name, :password, :password_confirmation, :provider, :remember_me, :uid, :username
  # attr_accessible :title, :body

  acts_as_paranoid
  validates_as_paranoid
  validates_uniqueness_of_without_deleted :username

  def get_name
    if !self.name.blank?
      self.name
    elsif !self.username.blank?
      self.username
    else
      self.email
    end
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      if User.where(["username =?", auth.extra.raw_info.username]).first
        auth.extra.raw_info.username += auth.uid
      end
      user = User.create({ :name => auth.extra.raw_info.name,
                           :username => auth.extra.raw_info.username,
                           :provider => auth.provider,
                           :uid => auth.uid,
                           :email => auth.info.email,
                           :access_token => auth.credentials.token,
                           :password => Devise.friendly_token[0, 20],
                         })
    end
    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if User.where(["username =?", auth.info.nickname]).first
      auth.info.nickname += auth.uid
    end
    unless user
      user = User.create({ :name => auth.info.name,
                           :username => auth.info.nickname,
                           :provider => auth.provider,
                           :uid => auth.uid,
                           :email => "#{auth.uid}@twitter.com", # Email address is not provided by the Twitter API.
                           :password => Devise.friendly_token[0,20]
                         })
    end
    user
  end
end
