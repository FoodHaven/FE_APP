require 'rails_helper'

RSpec.describe 'Market Index' do
  
  describe 'endpoint' do
    it 'returns all markets' do 
      create_list(:farmers_market, 5)
      get farmers_markets_path
      expect(response).to be_successful

      markets = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(markets.count).to eq(5)

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
    end
  end
end