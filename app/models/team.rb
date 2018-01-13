class Team < ApplicationRecord
  has_many :players

  validates :roster_name, presence: true
end
