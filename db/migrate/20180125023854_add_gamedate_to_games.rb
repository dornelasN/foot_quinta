class AddGamedateToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :game_date, :date
  end
end
