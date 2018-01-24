require 'rails_helper'
require './spec/support/helpers'

describe 'User show' do
  include Helpers
  let(:user) { create(:user) }
  it 'should redirect to login page if not logged_in' do
    get user_path(user)

    expect(response).to redirect_to(login_path)
  end

  it 'should display users posts if logged_in' do
    log_in_as(user.email, user.password)
    user.posts.create(title: 'Test Post Title', content: 'Test post content')

    get user_path(user)

    expect(response).to render_template('users/show')
    expect(response.body).to match(user.name)
    expect(response.body).to match(user.posts.count.to_s)
    expect(response.body).to match('Test Post Title')
    expect(response.body).to match('Test post content')
  end
end
