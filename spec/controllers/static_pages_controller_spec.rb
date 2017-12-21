require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe 'GET static_pages' do
    it '#home returns http success' do
      get :home
      expect(response).to have_http_status(:success)
    end

    it '#help returns http success' do
      get :help
      expect(response).to have_http_status(:success)
    end

    it '#about returns http success' do
      get :about
      expect(response).to have_http_status(:success)
    end

    it '#contact returns http success' do
      get :contact
      expect(response).to have_http_status(:success)
    end
  end
end
