require 'rails_helper'

describe 'User edit ' do
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
end