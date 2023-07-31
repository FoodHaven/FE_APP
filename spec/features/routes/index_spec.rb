require 'rails_helper'

RSpec.describe "Routes" do

  it "can find routes for market", :vcr do
    destination_lat = 40.77709768562554
    destination_lon = -73.87400881765025
    original_lat = 40.748594902847515
    original_lon = -73.98564294463469
    id = 2212
    json_response = File.read("spec/fixtures/transit_routes_2.json")

    response = stub_request(:get, "https://foodhaven-be.onrender.com/api/v1/markets/#{id}/transit_routes?original_lat=#{original_lat}&original_lon=#{original_lon}&destination_lat=#{destination_lat}&destination_lon=#{destination_lon}")
    .to_return(status: 200, body: '[{"name": "Route 1"}, {"name": "Route 2"}]', headers: { 'Content-Type' => 'application/json' })
    routes = JSON.parse(json_response, symbolize_names: true)
    
    expect(routes[3]).to have_key(:agency_name)
    expect(routes[3][:agency_name]).to eq("MTA Bus Company")
    expect(routes[3]).to have_key(:route_short_name)
    expect(routes[3][:route_short_name]).to eq("Q70-SBS")
    expect(routes[3]).to have_key(:headsign)
    expect(routes[3][:headsign]).to eq("Terminals C / B")
    expect(routes[3]).to have_key(:start_time)
    expect(routes[3][:start_time]).to eq(1690844322000)
    expect(routes[3]).to have_key(:end_time)
    expect(routes[3][:end_time]).to eq(1690844802000)
  end
  
end
