require 'rails_helper'

RSpec.describe Site, type: :model do
  context 'validations' do
    it 'long_url must be exist' do
      site = Site.new.save
      expect(site).to eq(false)
    end

    it 'should create a site' do
      site = Site.new(long_url: 'http://globo.com').save
      expect(site).to eq(true)
    end
  end
end