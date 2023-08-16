require "rails_helper"

RSpec.describe "Search for markets" do

  describe 'functionality and contents' do 
    it "can link to find markets page" do
      visit root_path
      click_on "Find a market near you"
      expect(current_path).to eq(markets_search_path)
    end

    it 'has a heading' do 
      visit markets_search_path
      expect(page).to have_content("Find a Market")
    end
    
    it "can search for market by address" do
      json_response = File.read('spec/fixtures/markets.json')
      latitude = 30.69035
      longitude = -88.045015
      radius = 5
      stub_request(:get, "https://foodhaven-be.onrender.com/api/v1/favorites?market_ids%5B%5D=1&market_ids%5B%5D=2").
          with(
            headers: {
            'Accept'=>'*/*',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent'=>'Faraday v2.7.10'
            }).
          to_return(status: 200, body: json_response, headers: {})

      markets = JSON.parse(json_response, symbolize_names: true)[:data]
      expect(markets).to be_a(Array)
      expect(markets.count).to eq(22)
      expect(markets.first).to be_a(Hash)
      expect(markets.first[:attributes][:name]).to eq("Market in The Park")
      expect(markets.second[:attributes][:name]).to eq("Market in The Park - Lavretta Park")
    end
    it "can search for markets by address" do
      visit markets_search_path
      fill_in :Street, with:  "6715 W Colfax Ave"
      fill_in :City, with: "Lakewood"
      fill_in :State, with: "CO"
      fill_in :Zip, with: 80041
      select "10", from: "radius"
      click_on "Find Markets"
    end

  end

  describe 'geolocation' do 
    before(:each) do 
      visit markets_search_path
    end

    describe 'contents' do 
      it 'Use My Location button' do 
        expect(page).to have_button("Use My Location")
      end

      it 'has form elements' do 
        expect(page).to have_content("Keep Search Within (miles):")
        expect(page).to have_field(:radius)
        expect(page).to have_button("Find Markets")
        expect(page).to have_field(:Street)
        expect(page).to have_field(:City)
        expect(page).to have_field(:State)
        expect(page).to have_field(:Zip)
        expect(page).to have_content("Street")
        expect(page).to have_content("City")
        expect(page).to have_content("State")
        expect(page).to have_content("Zipcode")
      end
    end
    
    describe 'usability' do
      it 'geolocates based on address' do 
        visit "/markets?address=6715 W Colfax Ave, Lakewood, CO 80214&radius=50"

        expect(current_path).to eq(markets_path)
      end
      
      it 'geolocates based on user location' do 
        
        visit "markets?latitude=39.6230656&longitude=-104.8608768&radius=50"

        expect(current_path).to eq(markets_path)
      end
    end  
  end
end
