require 'rails_helper'

describe 'User login' do
  it 'should re-render login page if invalid usr info is submitted' do
    post login_path, params: {
      session: {
        email: 'invalid@user-email',
        password: 'false'
      }
    }

    expect(response).to render_template('sessions/new')
    expect(flash[:danger]).to be_present
    # checking for login link if unsuccesful login
    expect(response.body).to match('Log in')
    expect(response.body).not_to match('Log out')
  end

  it 'should redirect to users/show if valid user info is submitted' do
    user = create(:user)

    post login_path, params: {
      session: {
        email: user.email,
        password: user.password
      }
    }
    follow_redirect!

    expect(response).to render_template('users/show')
    # checking for logout link if succesful login
    expect(response.body).to match('Log out')
    expect(response.body).not_to match('Log in')
  end
end