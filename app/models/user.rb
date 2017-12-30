class User < ApplicationRecord
  before_save { downcase_email }

  # Name attribute validation
  validates :name, presence: true, length: { maximum: 55 }

  # Email attribute validation
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    length: { maximum: 265 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  private

  def downcase_email
    email.downcase!
  end
end
