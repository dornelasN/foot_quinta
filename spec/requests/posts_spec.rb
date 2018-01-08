require 'rails_helper'
require './spec/support/helpers'

describe 'Posts redirects' do
  include Helpers
  it 'should redirect create when not logged in' do
    micropost_count_before_create = Post.count

    create_post('title', 'content')

    expect(micropost_count_before_create).to eq Post.count
  end

  it 'should redirect destroy when not logged in' do
    micropost_count_before_create = Post.count
    post = Post.first

    delete_post(post)

    expect(micropost_count_before_create).to eq Post.count
  end

  it 'should redirect destroy for wrong post' do
    user = create(:user)
    log_in_as(user.email, user.password)
    post = Post.first
    micropost_count_before_create = Post.count

    delete_post(post)
    follow_redirect!

    expect(micropost_count_before_create).to eq Post.count
    expect(response).to render_template(root_path)
  end
end

describe 'Post submissions' do
  include Helpers
  let(:user) { create(:user) }
  it 'should not create a new post if attributes are invalid' do
    micropost_count_before_create = Post.count
    log_in_as(user.email, user.password)

    # invalid title and content'
    create_post('', '')

    expect(micropost_count_before_create).to eq Post.count
    expect(response).to render_template('posts/new')
  end

  it 'should create a new post if attributes are valid' do
    micropost_count_before_create = Post.count
    log_in_as(user.email, user.password)

    create_post('Valid title', 'Valid content')
    follow_redirect!

    expect(micropost_count_before_create).to be < Post.count
    expect(response).to render_template(root_path)
  end

  it 'should delete a post if correct user' do
    log_in_as(user.email, user.password)
    post = user.posts.create(title: 'title', content: 'content')
    micropost_count_before_delete = Post.count

    delete_post(post)

    expect(micropost_count_before_delete).to be > Post.count
  end

  it 'should not render delete links when visiting other user profile' do
    log_in_as(user.email, user.password)
    get user_path(User.first)

    expect(response.body).not_to match('delete post')
  end
end
