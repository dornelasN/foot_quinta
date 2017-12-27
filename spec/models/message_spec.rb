require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'a new message' do
    before(:each) do
      attributes = {
        name: 'Messenger Name',
        email: 'name@test.com',
        body: 'Message body'
      }
      @message = Message.new attributes
    end

    it 'should respond to name, email, and body' do
      expect(@message).to respond_to(:name, :email, :body)
    end

    it 'should be valid when all attributes are set' do
      expect(@message).to be_valid
    end

    it 'should not be valid if name is blank' do
      @message.name = ''

      expect(@message).to_not be_valid, 'Blank name: message should be invalid'
      expect(@message.errors[:name].to_s).to match(/blank/)
    end

    it 'should not be valid if name is too long' do
      @message.name *= 4

      expect(@message).to_not be_valid,
        "Long name(#{@message.name.length}): message should be invalid"
    end

    it 'should not be valid if email is blank' do
      @message.email = ''

      expect(@message).to_not be_valid, 'Blank email: message should be invalid'
      expect(@message.errors[:email].to_s).to match(/blank/)
    end

    it 'should not be valid if email is too long' do
      @message.email *= 20

      expect(@message).to_not be_valid,
        "Long email (#{@message.email.length}): message should be invalid"
    end

    it 'should be valid if email is a valid address' do
      valid_addresses = %w[user@example.com USER@foo.com A_US-ER@foo.bar.org
                           first.last@foo.jp alice+bob@baz.cn]

      valid_addresses.each do |valid_address|
        @message.email = valid_address
        expect(@message).to be_valid, "#{@message.email}: should be valid"
      end
    end

    it 'should not be valid if email is not a valid address' do
      invalid_addresses = %w[user@example,com USER_at_foo.com user.name@example.
                             foo@bar_baz.com foo@bar+baz.com maike@bob..com]

      invalid_addresses.each do |invalid_address|
        @message.email = invalid_address
        expect(@message).to_not be_valid, "#{@message.email}: should be invalid"
      end
    end

    it 'should not be valid if body is blank' do
      @message.body = ''

      expect(@message).to_not be_valid, 'Blank body: message should be invalid'
      expect(@message.errors[:body].to_s).to match(/blank/)
    end
  end
end
