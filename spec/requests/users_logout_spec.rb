require 'rails_helper'
require './spec/support/helpers'

describe 'User logout' do
  include Helpers
  # Log in a user to test logout
  before :each do
    user = create(:user)
    log_in_as(user.email, user.password)
    follow_redirect!
    logout
    follow_redirect!
  end

  it 'should render root page' do
    expect(response).to render_template(root_path)
    expect(response.body).to match('Log in')
  end

  it 'should not be able to logout more than once in different windows or browsers' do
    # Simulate a user loggin out from multiple windows
    # user should not be able to logout as its not logged_in?
    logout
    follow_redirect!

    expect(response).to render_template(root_path)
  end
end