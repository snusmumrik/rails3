class AddFacebookFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uid, :integer, :after => :unconfirmed_email
    add_column :users, :provider, :string, :after => :uid
    add_column :users, :access_token, :string, :after => :provider
  end
end
