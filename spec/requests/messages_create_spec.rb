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

    follow_redirect!

    expect(ActionMailer::Base.deliveries.count).to eq(1)
    expect(response).to render_template(root_path)
    expect(flash[:success]).to be_present
  end


  it 'should not submit an invalid message' do
    post contact_path, params: {
      message: { name: '', email: '', body: '' }
    }

    expect(response).to render_template('shared/_form_errors')
  end
end