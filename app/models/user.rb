# Schema: User(name:string, email:string, password_digest:string)
class User < ApplicationRecord
  before_save { downcase_email }

  # Secure Password Attribute (password and password_confirmation)
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # Name attribute validation
  validates :name, presence: true, length: { maximum: 55 }

  # Email attribute validation
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    length: { maximum: 265 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  # Profile picture attribute
  mount_uploader :picture, ProfilePictureUploader
  validate :picture_size

  private

  def downcase_email
    email.downcase!
  end

  def picture_size
    errors.add(:picture, 'should be less than 5MB') if picture.size > 5.megabytes
  end
end
