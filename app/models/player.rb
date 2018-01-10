class Player < ApplicationRecord
  VALID_TEAMS = %w[Under-7 Under-8 Under-9 Under-10 Adults]
  VALID_POSITIONS = %w[Goalkeeper Defender Midfielder Forward]

  validates :name, :team, :position, :date_of_birth, presence: true

  validates_inclusion_of :team, in: VALID_TEAMS
  validates_inclusion_of :position, in: VALID_POSITIONS
end
