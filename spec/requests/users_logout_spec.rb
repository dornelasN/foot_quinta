require 'rails_helper'

describe 'User logout' do
  # Log in a user to test logout
  before :each do
    user = create(:user)

    post login_path, params: {
      session: {
        email: user.email,
        password: user.password
      }
    }
    follow_redirect!
  end

  it 'should render root page' do
    delete logout_path
    follow_redirect!

    expect(response).to render_template(root_path)
    expect(response.body).to match('Log in')

    # Simulate a user loggin out from multiple windows
    # user should not be able to logout as its not logged_in?
    delete logout_path
    follow_redirect!
  end
end