class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.integer :cuervos_goals
      t.string :adversary_team
      t.integer :adversary_goals
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
