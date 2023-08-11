require 'rails_helper'

RSpec.describe 'Markets' do
  before(:each) do
    create_list(:farmers_market, 10)
    @farmers_market = create(:farmers_market, longitude: -104.0000000, latitude: 42.0000000)
    @farmers_market = create(:farmers_market, longitude: -104.2, latitude: 42.3)
  end

  describe 'find by long, lat & radius' do
    it 'hits the endpoint' do 
      query_params = {
        longitude: -104.0000000, 
        latitude: 42.0000000, 
        radius: 50
      }

      get farmers_markets_search_path, params: query_params

      expect(response).to be_successful
    end

    it 'returns json objects' do 
      query_params = {
        longitude: -104.0000000, 
        latitude: 42.0000000, 
        radius: 50
      }

      get farmers_markets_search_path(query_params) #, params: query_params

      markets = JSON.parse(response.body, symbolize_names: true)[:data]
      
      markets.each do |farmers_market|
        expect(farmers_market[:attributes]).to have_key(:name)
        expect(farmers_market[:attributes][:name]).to be_a(String)
        
        expect(farmers_market[:attributes]).to have_key(:address)
        expect(farmers_market[:attributes][:address]).to be_a(String)

        expect(farmers_market[:attributes]).to have_key(:site)
        expect(farmers_market[:attributes][:site]).to be_a(String)

        expect(farmers_market[:attributes]).to have_key(:description)
        expect(farmers_market[:attributes][:description]).to be_a(String)

        expect(farmers_market[:attributes]).to have_key(:fnap)
        expect(farmers_market[:attributes][:fnap]).to be_a(String)

        expect(farmers_market[:attributes]).to have_key(:snap_option)
        expect(farmers_market[:attributes][:snap_option]).to be_a(String)

        expect(farmers_market[:attributes]).to have_key(:accepted_payment)
        expect(farmers_market[:attributes][:accepted_payment]).to be_a(String)

        expect(farmers_market[:attributes]).to have_key(:longitude)
        expect(farmers_market[:attributes][:longitude]).to be_an(Float)

        expect(farmers_market[:attributes]).to have_key(:latitude)
        expect(farmers_market[:attributes][:latitude]).to be_an(Float)
      end

      expect(markets.count >= 2).to be true
    end
  end
end