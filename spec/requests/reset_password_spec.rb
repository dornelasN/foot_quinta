require 'rails_helper'
require './spec/support/helpers'

describe 'Password reset' do
  include Helpers
  let(:user) { create(:user) }

  it 'should send an email to user email if email is valid' do
    user.reset_token = User.new_token

    send_reset_password_email(user.email)
    follow_redirect!

    expect(ActionMailer::Base.deliveries.count).to eq(1)
    expect(response).to render_template(root_path)
    expect(flash[:info]).to be_present
  end

  it 'should re-render password_resets view if email is invalid' do
    send_reset_password_email('invalid@email.com')

    expect(response).to render_template('password_resets/new')
    expect(flash[:danger]).to be_present
  end

  it 'should update user password and login user if fields are valid' do
    user.reset_token = User.new_token
    send_reset_password_email(user.email)
    user = assigns(:user)

    reset_user_password(user, 'foobar')
    follow_redirect!

    expect(is_logged_in?).to be true
    expect(flash[:success]).to be_present
    expect(response).to render_template('users/show')
  end

  it 'should not reset password if password fields are invalid' do
    user.reset_token = User.new_token
    send_reset_password_email(user.email)
    user = assigns(:user)

    reset_user_password(user, '')

    expect(response.body).to match('error')
  end

  it 'should not reset password if token is expired' do
    user.reset_token = User.new_token
    send_reset_password_email(user.email)
    user = assigns(:user)
    user.update_attribute(:reset_sent_at, 3.hours.ago)

    reset_user_password(user, 'foobar')
    follow_redirect!

    expect(response.body).to match('expired')
  end
end
