class Game < ApplicationRecord
  belongs_to :team
  default_scope -> { order(game_date: :desc) }
  validates :adversary_team, :game_date, presence: true

  validates :cuervos_goals, :adversary_goals, presence: true,
                                              numericality: { greater_than_or_equal_to: 0 }
end
