class AddProviderAndUidAndAvatarUrlColumnsToUsersTable < ActiveRecord::Migration
  def up
    add_column :users, :provider, :string
    change_column_null :users, :provider, false
    add_column :users, :uid, :string
    change_column_null :users, :uid, false
    add_column :users, :avatar_url, :string
    change_column_null :users, :avatar_url, false
  end

  def down
    remove_column :users, :provider
    remove_column :users, :uid
    remove_column :users, :avatar_url
  end
end
