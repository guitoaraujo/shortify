require 'rails_helper'

RSpec.describe SitesController, type: :controller do
  before(:each) do
    Site.new(long_url: 'http://test.com').save
  end

  context 'GET :index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_success
    end
  end

  context 'GET :show' do
    it 'returns a success response' do
      get :show, params: { id: '1' }
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
    it 'returns a success redirect' do
      post :create, params: { site: { long_url: 'http://test1.com' } }
      expect(response).to redirect_to(site_path(id: 2))
    end
  end

  context 'GET :populate' do
    it 'returns a success redirect' do
      get :populate_me
      expect(response).to redirect_to(sites_path)
    end
  end

  context 'GET :get_long_url' do
    it 'returns a success redirect' do
      site = Site.first
      get :get_long_url
      expect(response).to redirect_to(site.long_url)
    end
  end
end