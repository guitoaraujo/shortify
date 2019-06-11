require 'rails_helper'

RSpec.describe Api::V1::SitesController, type: :controller do
  context 'GET :show' do
    it 'returns a success response' do
      post :show, params: { long_url: 'http://test.com' }
      expect(response).to be_success
    end
  end
end
