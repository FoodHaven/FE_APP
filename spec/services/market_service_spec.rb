require 'rails_helper'

RSpec.describe MarketService do
  let(:market_service) { MarketService.new }

  describe '#all_markets' do
    it 'fetches all markets within the given radius' do

      latitude = 40.7128
      longitude = -74.0060
      radius = 10

      stub_request(:get, "#{Figaro.env.Elastic_Beanstalk}/markets?latitude=#{latitude}&longitude=#{longitude}&radius=#{radius}")
        .to_return(status: 200, body: '[{"name": "Market 1"}, {"name": "Market 2"}]', headers: { 'Content-Type' => 'application/json' })
      response = market_service.all_markets(latitude, longitude, radius)

      expect(response).to be_an(Array)
      expect(response.size).to eq(2)
      expect(response[0][:name]).to eq('Market 1')
      expect(response[1][:name]).to eq('Market 2')
    end
  end

  describe '#one_market' do
    it 'fetches a single market by ID' do
      market_id = 1

      stub_request(:get, "#{Figaro.env.Elastic_Beanstalk}/markets/#{market_id}")
        .to_return(status: 200, body: '{"name": "Market 1"}', headers: { 'Content-Type' => 'application/json' })

      response = market_service.one_market(market_id)

      expect(response).to be_a(Hash)
      expect(response[:name]).to eq('Market 1')
    end
  end

  describe '#fetch_favorite_markets' do
    it 'fetches favorite markets for given IDs' do
      market_ids = [1, 2]

      stub_request(:get, "#{Figaro.env.Elastic_Beanstalk}/favorites?market_ids[]=1&market_ids[]=2")
        .to_return(status: 200, body: '[{"name": "Market 1"}, {"name": "Market 2"}]', headers: { 'Content-Type' => 'application/json' })

      response = market_service.fetch_favorite_markets(market_ids)

      expect(response).to be_an(Array)
      expect(response.size).to eq(2)
      expect(response[0][:name]).to eq('Market 1')
      expect(response[1][:name]).to eq('Market 2')
    end
  end
end

