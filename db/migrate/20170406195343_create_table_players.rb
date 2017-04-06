class CreateTablePlayers < ActiveRecord::Migration
  def change
    create_table :players do |table|
      table.string :first_name, null: false
      table.string :last_name, null: false
      table.string :position, null: false
      table.string :nfl_team, null: false
      table.belongs_to :team
    end
  end
end
