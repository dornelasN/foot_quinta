require 'rails_helper'

describe 'POST #create' do
  it 'should send a message and return a success notice' do
    post contact_path, params: {
      message: {
        name: 'Test',
        email: 'test@email.com',
        body: 'Message Test'
      }
    }

    # expect(response).to redirect_to(assigns(:message))
    follow_redirect!

    expect(response).to render_template(root_path)
    expect(flash[:success]).to be_present
  end

  it 'should not submit an invalid message' do
    post contact_path, params: {
      message: { name: '', email: '', body: '' }
    }

    expect(flash[:danger]).to be_present
  end
end