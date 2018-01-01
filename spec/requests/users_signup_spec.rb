require 'rails_helper'

describe 'User signup' do
  it 'should re-render the sign up page if invalid information is submitted' do
    post signup_path, params: {
      user: {
        name: '',
        email: 'invalid-user@email',
        password: 'foo',
        password_confirmation: 'bar'
      }
    }

    expect(response).to render_template('users/new')
    expect(response).to render_template('shared/_form_errors')
  end

  it 'should create a new user and login if valid information is submitted' do
    post signup_path, params: {
      user: {
        name: 'Test User',
        email: 'test@email.com',
        password: 'password',
        password_confirmation: 'password'
      }
    }

    expect(flash[:success]).to be_present
    # TODO: improve sign up test
  end
end