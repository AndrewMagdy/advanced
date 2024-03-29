class AddProviderUidOauthTokenEmailNameOauthExpiresAtToUser < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_expires_at, :datetime
    add_column :users, :email, :string
    add_column :users, :name, :string
  end
end
