require 'rails_helper'

describe 'User login' do
  it 'should re-render login page if invalid usr info is submitted' do
    post login_path, params: {
      session: {
        email: 'invalid@user-email',
        password: 'false'
      }
    }

    expect(response).to render_template('sessions/new')
    expect(flash[:danger]).to be_present
  end

end