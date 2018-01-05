require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'a new user' do
    before(:each) do
      @user = User.new(name: 'Test User Name', email: 'user_email@test.com',
                       password: 'password', password_confirmation: 'password')
    end

    it 'should respond to name, email, password, and password confirmation' do
      expect(@user).to respond_to(:name, :email)
    end

    it 'should be valid when all attributes are set' do
      expect(@user).to be_valid
    end

    it 'should not be valid if name is blank' do
      @user.name = ''

      expect(@user).to_not be_valid, 'Blank name: user should be invalid'
      expect(@user.errors[:name].to_s).to match(/blank/)
    end

    it 'should not be valid if name is too long' do
      @user.name *= 4

      expect(@user).to_not be_valid,
        "Long name(#{@user.name.length}): user should be invalid"
    end

    it 'should not be valid if email is blank' do
      @user.email = ''

      expect(@user).to_not be_valid, 'Blank email: user should be invalid'
      expect(@user.errors[:email].to_s).to match(/blank/)
    end

    it 'should not be valid if email is too long' do
      @user.email *= 14

      expect(@user).to_not be_valid,
        "Long email (#{@user.email.length}): user should be invalid"
    end

    it 'should be valid if email is a valid address' do
      valid_addresses = %w[user@example.com USER@foo.com A_US-ER@foo.bar.org
                           first.last@foo.jp alice+bob@baz.cn]

      valid_addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid, "#{@user.email}: should be valid"
      end
    end

    it 'should not be valid if email is not a valid address' do
      invalid_addresses = %w[user@example,com USER_at_foo.com user.name@example.
                             foo@bar_baz.com foo@bar+baz.com maike@bob..com]

      invalid_addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).to_not be_valid, "#{@user.email}: should be invalid"
      end
    end

    it 'should have unique email address' do
      duplicate_user = @user.dup
      @user.save
      duplicate_user.email = @user.email.upcase

      expect(duplicate_user).to_not be_valid
    end

    it 'should save the email address as lower-case' do
      mixed_case_email = 'FoO@ExamPle.COM'
      @user.email = mixed_case_email
      @user.save

      expect(@user.reload.email).to eq mixed_case_email.downcase
    end

    it 'should not be valid if password is blank' do
      @user.password = @user.password_confirmation = ''

      expect(@user).not_to be_valid
    end

    it 'should not be valid if password is smaller than 6 characters' do
      @user.password = @user.password_confirmation = 'a' * 5

      expect(@user).not_to be_valid
    end

    it 'should not be authenticated with a nil digest' do
      expect(@user.authenticated?(:remember, '')).to eq false
    end
  end
end
