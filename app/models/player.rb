class Player < ApplicationRecord
  belongs_to :team

  VALID_POSITIONS = %w[Goalkeeper Defender Midfielder Forward]

  validates :name, :position, :date_of_birth, presence: true
  validates_inclusion_of :position, in: VALID_POSITIONS
end
