require "rails_helper"

RSpec.describe MessageMailer, type: :mailer do
  describe 'contact_me' do
    message = {
                name: 'Test name',
                email: 'test@email.com',
                body: 'Email body content'
              }
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    let(:mail) { MessageMailer.contact_me(Message.new(message)) }

    it 'should send an email' do
      mail.deliver

      expect(ActionMailer::Base.deliveries.count).to eq(1)
    end

    it 'renders the headers' do
      expect(mail.subject).to eq('Message from SB Cuervos website')
      expect(mail.to).to eq(['ndornelasj@gmail.com'])
      expect(mail.from).to eq(['test@email.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Email body content')
    end
  end

end
