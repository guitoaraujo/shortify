require 'rails_helper'

RSpec.describe Site, type: :model do
  context 'validations' do
    before(:each) do
      Site.new(long_url: 'http://test.com').save
    end

    it 'long_url must be exist' do
      site = Site.new.save
      expect(site).to eq(false)
    end

    it 'long_url must be uniq' do
      site = Site.new(long_url: 'http://test.com').save
      expect(site).to eq(false)
    end

    it 'should create a site' do
      site = Site.new(long_url: 'http://globo.com').save
      expect(site).to eq(true)
    end
  end

  context 'scopes' do
    before(:each) do
      Site.new(long_url: 'http://test1.com').save
      Site.new(long_url: 'http://test2.com').save
      Site.new(long_url: 'http://test3.com').save
    end

    it 'should return most visited sites' do
      expect(Site.most_visited.size).to eq(3)
    end
  end
end