require 'rails_helper'
require './spec/support/helpers'

describe 'User edit' do
  include Helpers
  context 'with invalid data' do
    it 'should re-render the edit view' do
      user = create(:user)
      log_in_as(user.email, user.password)

      # Edit user with invalid attributes
      edit_user(user, '', 'invalid@email', 'foo', 'bar')

      expect(response).to render_template('users/edit')
    end
  end

  context 'with valid data' do
    it 'should render the profile view with udpated attributes' do
      user = create(:user)
      log_in_as(user.email, user.password)
      name = 'New Name'
      email = 'valid@email.com'

      edit_user(user, name, email)
      follow_redirect!
      user.reload

      expect(user.name).to eq(name)
      expect(user.email).to eq(email)
      expect(response).to render_template('users/show')
      expect(response.body).to match('New Name')
      expect(flash[:success]).to be_present
    end
  end

  context 'logged in as wrong user' do
    it 'should redirect edit action to root_path' do
      user = create(:user)
      other_user = create(:user)
      log_in_as(user.email, user.password)

      get edit_user_path(other_user)
      follow_redirect!

      expect(response).to render_template(root_path)
    end

    it 'should redirect update to root_path' do
      user = create(:user)
      other_user = create(:user)
      log_in_as(user.email, user.password)

      edit_user(other_user, 'Some Name', 'valid@email.com')
      follow_redirect!

      expect(flash).not_to be_present
      expect(response).to render_template(root_path)
    end
  end
end
