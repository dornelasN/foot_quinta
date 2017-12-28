# Preview all emails at http://localhost:3000/rails/mailers/message
class MessagePreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/message/contact_me
  def contact_me
    message = Message.new name:   'Test Name',
                          email:  'email@test.com',
                          body:   'This is the body of a test email'

    MessageMailer.contact_me message
  end

end
