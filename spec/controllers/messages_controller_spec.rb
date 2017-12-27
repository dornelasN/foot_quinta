require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'should send a message and return a success notice' do
      post :create, params: {
        message: {
          name: 'Test',
          email: 'test@example.com',
          body: 'Message Test'
        }
      }

      expect(response).to redirect_to(assigns(:message))
      follow_redirect!

      expect(response).to render_template(root_path)
      expect(response).to match('Message received, thanks!')
    end
  end
end
