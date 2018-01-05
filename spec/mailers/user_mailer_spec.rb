require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'password_reset' do
    let(:user) { create(:user) }
    let(:mail) { UserMailer.password_reset(user) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Password Reset')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['noreply@sbcuervos.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Hi')
    end
  end
end
