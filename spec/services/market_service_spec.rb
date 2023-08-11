require 'rails_helper'

RSpec.describe MarketService do
  let(:market_service) { MarketService.new }

  describe '#all_markets' do
    it 'fetches all markets within the given radius', :vcr do
      market_params = {
        latitude: 35.880,
        longitude: -106.0658,
        radius: 20
      }

      response = market_service.all_markets(market_params[:latitude], market_params[:longitude], market_params[:radius])

      expect(response).to be_a(Hash)
      expect(response[:data]).to be_an(Array)
      expect(response[:data].size).to eq(8)
      expect(response[:data][0][:attributes][:name]).to eq('Espanola Farmers Market')
      expect(response[:data][1][:attributes][:name]).to eq('Espanola Farmers Market') # Update accordingly
    end
  end

  describe '#one_market' do
    it 'fetches a single market by ID', :vcr do
      market_id = 1

      response = market_service.one_market(market_id)

      expect(response).to be_a(Hash)
      expect(response[:data]).to be_a(Hash)
      expect(response[:data][:attributes]).to be_an(Hash)
      expect(response[:data][:attributes][:name]).to eq('Colorado Farm and Art Market')
    end
  end

  describe '#favorite_markets' do
    it 'fetches favorite markets for given IDs', :vcr do
      market_ids = [1, 2]

      response = market_service.favorite_markets(market_ids)

      expect(response).to be_a(Hash)
      expect(response[:data]).to be_an(Array)
      expect(response[:data].size).to eq(2)
      expect(response[:data][0][:attributes][:name]).to eq('Colorado Farm and Art Market')
      expect(response[:data][1][:attributes][:name]).to eq('Market in The Park')
    end
  end
end
