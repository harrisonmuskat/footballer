class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |table|
      table.string :first_name
      table.string :last_name
      table.string :username, null: false
      table.string :email, null: false
    end
  end
end
