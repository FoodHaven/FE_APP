require 'rails_helper'

RSpec.describe 'Markets' do
  before(:each) do
    create_list(:market, 10)
    @market = create(:market, longitude: -104.0000000, latitude: 42.0000000)
    @market = create(:market, longitude: -104.2, latitude: 42.3)
  end

  describe 'find by long, lat & radius' do
    it 'hits the endpoint' do 
      query_params = {
        longitude: -104.0000000, 
        latitude: 42.0000000, 
        radius: 50
      }

      get api_v1_markets_search_path, params: query_params

      expect(response).to be_successful
    end

    it 'returns json objects' do 
      query_params = {
        longitude: -104.0000000, 
        latitude: 42.0000000, 
        radius: 50
      }

      get api_v1_markets_search_path, params: query_params

      markets = JSON.parse(response.body, symbolize_names: true)[:data]
      
      markets.each do |market|
        expect(market[:attributes]).to have_key(:name)
        expect(market[:attributes][:name]).to be_a(String)
        
        expect(market[:attributes]).to have_key(:address)
        expect(market[:attributes][:address]).to be_a(String)

        expect(market[:attributes]).to have_key(:site)
        expect(market[:attributes][:site]).to be_a(String)

        expect(market[:attributes]).to have_key(:description)
        expect(market[:attributes][:description]).to be_a(String)

        expect(market[:attributes]).to have_key(:fnap)
        expect(market[:attributes][:fnap]).to be_a(String)

        expect(market[:attributes]).to have_key(:snap_option)
        expect(market[:attributes][:snap_option]).to be_a(String)

        expect(market[:attributes]).to have_key(:accepted_payment)
        expect(market[:attributes][:accepted_payment]).to be_a(String)

        expect(market[:attributes]).to have_key(:longitude)
        expect(market[:attributes][:longitude]).to be_an(Float)

        expect(market[:attributes]).to have_key(:latitude)
        expect(market[:attributes][:latitude]).to be_an(Float)
      end

      expect(markets.count >= 2).to be true
    end
  end
end