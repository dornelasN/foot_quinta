class Player < ApplicationRecord
  belongs_to :team

  VALID_POSITIONS = %w[Goalkeeper Defender Midfielder Forward]

  validates :name, :position, :date_of_birth, :phone_number, presence: true
  validates_inclusion_of :position, in: VALID_POSITIONS

  validates :phone_number, length: { is: 10 }
  mount_uploader :picture, PictureUploader
end
