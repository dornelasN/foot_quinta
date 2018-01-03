require 'rails_helper'

describe 'User login with invalid information' do
  before :each do
    post login_path, params: {
      session: {
        email: 'invalid@user-email',
        password: 'false'
      }
    }
  end

  it 'should re-render login page if invalid usr info is submitted' do
    expect(response).to render_template('sessions/new')
    expect(flash[:danger]).to be_present
    # checking for login link if unsuccesful login
    expect(response.body).to match('Log in')
    expect(response.body).not_to match('Log out')
  end
end

describe 'User login with valid information' do
  before :each do
    user = create(:user)

    post login_path, params: {
      session: {
        email: user.email,
        password: user.password,
        remember_me: '1'
      }
    }
  end

  it 'should redirect to users/show if valid user info is submitted' do
    follow_redirect!

    expect(response).to render_template('users/show')
    # checking for logout link if succesful login
    expect(response.body).to match('Log out')
    expect(response.body).not_to match('Log in')
  end

  it 'should remember user cookies if checked "remember_me"' do
    expect(cookies['remember_token']).not_to be_empty
  end

  it 'should forget user cookies if unchecked "remember_me"' do
    # Login with 'remember_me' unchecked
    user = create(:user)

    post login_path, params: {
      session: {
        email: user.email,
        password: user.password,
        remember_me: '0'
      }
    }

    expect(cookies['remember_token']).to be_empty
  end
end