class Team < ApplicationRecord
  has_many :players
  has_many :games
  validates :roster_name, presence: true
end
