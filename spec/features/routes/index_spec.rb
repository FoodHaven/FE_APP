require 'rails_helper'

RSpec.describe "Routes index page" do

  it "can find routes for market", :vcr do
    json_response = File.read('spec/fixtures/transit_routes.json')
    destination_lat = 40.77709768562554
    destination_lon = -73.87400881765025
    original_lat = 40.748594902847515
    original_lon = -73.98564294463469
    id = 2212
    request = stub_request(:get, "https://foodhaven-be.onrender.com/api/v1/markets/#{id}/transit_routes?original_lat=#{original_lat}&original_lon=#{original_lon}&destination_lat=#{destination_lat}&destination_lon=#{destination_lon}")
    .with(
      headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Faraday v2.7.10'
      })
    .to_return(status: 200, body: json_response, headers: {})
    routes = JSON.parse(json_response, symbolize_names: true)
    expect(routes).to be_a(Array)
    expect(routes[3][:end_time]).to eq(1690844802000)
    expect(routes[3][:start_time]).to eq(1690844322000)
    expect(routes[3][:headsign]).to eq("Terminals C / B")
    expect(routes[3][:route_short_name]).to eq("Q70-SBS")
    expect(routes[3][:agency_name]).to eq("MTA Bus Company")
  end
  
  it "doesnt show routes if unavailable" do
    visit market_routes_path(1)
    expect(page).to have_content("No routes found")
  end
end
