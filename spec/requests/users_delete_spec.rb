require 'rails_helper'
require './spec/support/helpers'

describe 'DELETE users' do
  include Helpers
  it 'should redirect to login path when not logged in' do
    user = create(:user)
    user_count_before_delete = User.count

    delete_user(user)
    follow_redirect!

    expect(User.count).to eq user_count_before_delete
    expect(response).to render_template('sessions/new')
  end

  it 'should redirect to root path when not logged in as admin' do
    user = create(:user)
    other_user = create(:user)
    user_count_before_delete = User.count
    log_in_as(other_user.email, other_user.password)

    delete_user(user)
    follow_redirect!

    expect(User.count).to eq user_count_before_delete
    expect(response).to render_template(root_path)
  end

  it 'admin users should be able to delete other (non-admin) users' do
    admin = create(:admin)
    user = create(:user)
    log_in_as(admin.email, admin.password)
    user_count_before_delete = User.count

    delete_user(user)

    expect(User.count).to be < user_count_before_delete
    expect(response).to render_template('users/index')
    expect(flash[:success]).to be_present
  end

  it 'admin users should not be able to delete other admin users' do
    admin = create(:admin)
    other_admin = create(:admin)
    log_in_as(admin.email, admin.password)
    user_count_before_delete = User.count

    delete_user(other_admin)

    expect(User.count).to eq user_count_before_delete
    expect(response).to render_template('users/index')
    expect(flash[:danger]).to be_present
  end

  it 'associated posts should be destroyed with user deletion' do
    user = create(:user)
    post = create(:post, user_id: user.id)
    posts_count_before_user_delete = Post.count

    user.destroy

    expect(Post.count).to be < posts_count_before_user_delete
  end
end
