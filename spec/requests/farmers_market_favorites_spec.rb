require 'rails_helper'

RSpec.describe 'Markets' do
  before(:each) do
    @market_1_id = create(:farmers_market).id
    @market_2_id = create(:farmers_market).id
    @market_3_id = create(:farmers_market).id
    @market_4_id = create(:farmers_market).id
    @market_5_id = create(:farmers_market).id
  end

  describe 'find favorites by id' do
    it 'hits the endpoint' do 
      query_params = {
        market_ids: [@market_1_id, @market_2_id, @market_4_id ]
      }
      get farmers_markets_db_favorites_path, params: query_params

      expect(response).to be_successful
    end

    it 'returns the correct json objects' do 
      query_params = {
        market_ids: [@market_1_id, @market_2_id, @market_4_id ]
      }

      get  farmers_markets_db_favorites_path, params: query_params

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

      market_ids = markets.map { |farmers_market| farmers_market[:attributes][:id] }

      expect(markets.count == 3).to be true
      expect(market_ids).to_not include(@market_3_id, @market_5_id)
    end
  end
end