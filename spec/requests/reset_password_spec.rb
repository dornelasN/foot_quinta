require 'rails_helper'

describe 'Password reset' do
  it 'should send an email to user email if email is valid' do
    user = create(:user)
    user.reset_token = User.new_token

    reset_password(user.email)
    follow_redirect!

    expect(ActionMailer::Base.deliveries.count).to eq(1)
    expect(response).to render_template(root_path)
    expect(flash[:info]).to be_present
  end

  it 'should re-render password_resets view if email is invalid' do
    reset_password('invalid@email.com')

    expect(response).to render_template('password_resets/new')
    expect(flash[:danger]).to be_present
  end
end

def reset_password(email)
  post password_resets_path, params: {
    password_reset: { email: email }
  }
end