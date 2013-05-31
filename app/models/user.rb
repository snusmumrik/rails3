class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  #:confirmable,
  :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :access_token, :email, :name, :password, :password_confirmation, :provider, :remember_me, :uid
  # attr_accessible :title, :body

  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:auth.info.nickname,
                         provider:auth.provider,
                         uid:auth.uid,
                         email:"#{auth.uid}@twitter.com", # Email address is not provided by the Twitter API.
                         password:Devise.friendly_token[0,20]
                         )
    end
    user
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create({
        :name => auth.extra.raw_info.name,
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
end
