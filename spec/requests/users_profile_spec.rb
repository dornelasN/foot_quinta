require 'rails_helper'

describe 'User show' do
  let(:user) { create(:user) }
  it 'should display users posts' do
    user.posts.create(title: 'Test Post Title', content: 'Test post content')

    get user_path(user)

    expect(response).to render_template('users/show')
    expect(response.body).to match(user.name)
    expect(response.body).to match(user.posts.count.to_s)
    expect(response.body).to match('Test Post Title')
    expect(response.body).to match('Test post content')
  end
end
