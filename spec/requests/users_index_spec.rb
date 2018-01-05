require 'rails_helper'
require './spec/support/helpers'

describe 'GET index' do
  it 'should redirect to login page if not logged in' do
    get users_path
    follow_redirect!

    expect(response).to render_template('sessions/new')
  end
end