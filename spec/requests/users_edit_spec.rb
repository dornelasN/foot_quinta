require 'rails_helper'

describe 'User edit' do
  context 'with invalid data' do
    it 'should re-render the edit view' do
      user = create(:user)

      patch user_path(user), params: {
        user: {
          name: '',
          email: 'invalid@email',
          password: 'foo',
          password_confirmation: 'bar'
        }
      }

      expect(response).to render_template('users/edit')
    end
  end

  context 'with valid data' do
    it 'should render the profile view with udpated attributes' do
      user = create(:user)
      name = 'New Name'
      email = 'valid@email.com'

      patch user_path(user), params: {
        user: {
          name: name,
          email: email,
          password: '',
          password_confirmation: ''
        }
      }
      follow_redirect!
      user.reload

      expect(user.name).to eq(name)
      expect(user.email).to eq(email)
      expect(response).to render_template('users/show')
      expect(response.body).to match('New Name')
      expect(flash[:success]).to be_present
    end
  end
end