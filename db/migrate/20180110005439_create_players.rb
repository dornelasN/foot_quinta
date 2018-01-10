class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name
      t.string :team
      t.string :position
      t.date :date_of_birth

      t.timestamps
    end
  end
end
