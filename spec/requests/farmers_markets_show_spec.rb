require 'rails_helper'

RSpec.describe 'Markets' do
  before(:each) do
    create_list(:farmers_market, 10)
    @farmers_market = FarmersMarket.last
  end

  describe 'find a single farmers_market' do
    it 'hits the endpoint' do 
      get farmers_market_path(@farmers_market)
      
      expect(response).to be_successful
    end
    
    it 'returns json object for the correct farmers_market' do 
      get farmers_market_path(@farmers_market)

      farmers_market = JSON.parse(response.body, symbolize_names: true)[:data]
      
        expect(farmers_market[:attributes]).to have_key(:name)
        expect(farmers_market[:attributes][:name]).to eq(@farmers_market.name)
        
        expect(farmers_market[:attributes]).to have_key(:address)
        expect(farmers_market[:attributes][:address]).to eq(@farmers_market.address)

        expect(farmers_market[:attributes]).to have_key(:site)
        expect(farmers_market[:attributes][:site]).to eq(@farmers_market.site)

        expect(farmers_market[:attributes]).to have_key(:description)
        expect(farmers_market[:attributes][:description]).to eq(@farmers_market.description)

        expect(farmers_market[:attributes]).to have_key(:fnap)
        expect(farmers_market[:attributes][:fnap]).to eq(@farmers_market.fnap)

        expect(farmers_market[:attributes]).to have_key(:snap_option)
        expect(farmers_market[:attributes][:snap_option]).to eq(@farmers_market.snap_option)

        expect(farmers_market[:attributes]).to have_key(:accepted_payment)
        expect(farmers_market[:attributes][:accepted_payment]).to eq(@farmers_market.accepted_payment)

        expect(farmers_market[:attributes]).to have_key(:longitude)
        expect(farmers_market[:attributes][:longitude]).to eq(@farmers_market.longitude)

        expect(farmers_market[:attributes]).to have_key(:latitude)
        expect(farmers_market[:attributes][:latitude]).to eq(@farmers_market.latitude)
      end
  end
end