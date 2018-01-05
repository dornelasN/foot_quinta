require 'rails_helper'
require './spec/support/helpers'

describe 'POST make_admin' do
  include Helpers
  it 'regular users should not be able to make other users admin' do
    user = create(:user)
    other_user = create(:user)
    log_in_as(user.email, user.password)

    post make_admin_path(other_user)
    follow_redirect!

    expect(other_user.admin?).to eq false
    expect(response).to render_template(root_path)
  end

  it 'admin users should be able to make other users admin' do
    user = create(:user)
    admin = create(:admin)
    log_in_as(admin.email, admin.password)

    post make_admin_path(user)
    user.reload

    expect(user.admin?).to eq true
    expect(response).to render_template('users/index')
  end
end
