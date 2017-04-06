class CreateTeamsTable < ActiveRecord::Migration
  def change
    create_table :teams do |table|
      table.string :name, null: false
      table.belongs_to :user
    end
  end
end
