require 'rails_helper'

RSpec.describe SitesController, type: :controller do
  context 'GET :index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_success
    end
  end

  context 'GET :new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_success
    end
  end

  context 'POST :create' do
    it 'returns a success response' do
      post :create, params: { site: { long_url: 'http://test.com' } }
      expect(response).to redirect_to(sites_path)
    end
  end
end
