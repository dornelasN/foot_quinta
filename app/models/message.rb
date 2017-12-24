# The message model is used to create the contact message sent through the
# form on the contact view
class Message
  include ActiveModel::Model
  attr_accessor :name, :email, :body
  validates :name, presence: true, length: { maximum: 55 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :body, presence: true
end
