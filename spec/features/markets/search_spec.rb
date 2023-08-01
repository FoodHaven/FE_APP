require "rails_helper"

RSpec.describe "Search for markets" do
  it "can link to find markets page" do
    visit root_path
    click_on "Find a market near you"
    expect(current_path).to eq(markets_search_path)
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

  it 'allows the user to select a radius distance and submit the form' do
    stub_request(:get, "https://foodhaven-be.onrender.com/api/v1/markets?latitude=42.123456&longitude=-71.654321&radius=10.0").
    with(
      headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v2.7.10'
      }).
    to_return(status: 200, body:
    '{
      "data": [
        {
          "id": "3786",
          "type": "market",
          "attributes": {
            "name": "Alternatives Heritage Market",
            "address": "50 Douglas Road Whitinsville, MA 01588",
            "site": null,
            "description": null,
            "fnap": null,
            "snap_option": null,
            "accepted_payment": null,
            "longitude": -71.67893541996273,
            "latitude": 42.10819969064286
          }
        }
      ]
    }', headers: {})

    allow(Geocoder).to receive(:search).and_return([double('location', coordinates: [42.123456, -71.654321])])

    visit markets_search_path

    select 10, from: :radius
    click_button 'Find Markets'
    expect(page).to have_current_path(markets_path, ignore_query: true)
    expect(page).to have_content("Closest Farmer's Markets")
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
        expect(page).to have_content("Within (Miles)")
        expect(page).to have_field(:radius)
        expect(page).to have_button("Find Markets")
        expect(page).to have_field(:zip)
        expect(page).to have_content("Zipcode")
      end
    end
    
    describe 'usability' do
      it 'geolocates based on zipcode' do 
        fill_in :zip, with: 80111
        select 50, from: :radius
        click_button "Find Markets"

        expect(current_path).to eq(markets_path)
      end

      it 'geolocates based on user location' do 
        click_button "Use My Location"

        select 50, from: :radius

        click_button "Find Markets"

        expect(current_path).to eq(markets_path)
      end
    end
  end
end
