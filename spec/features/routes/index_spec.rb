require 'rails_helper'

RSpec.describe "Routes" do

  it "can find routes for market", :vcr do
    json_response = File.read('./fixtures/transit_search.json')
    destination_lat = 40.77709768562554
    destination_lon = -73.87400881765025
    original_lat = 40.748594902847515
    original_lon = -73.98564294463469
    id = 2212
    request = stub_request(:get, "https://foodhaven-be.onrender.com/api/v1/markets/#{id}/transit_routes?original_lat=#{original_lat}&original_lon=#{original_lon}&destination_lat=#{destination_lat}&destination_lon=#{destination_lon}")
    routes = JSON.parse(json_response, symbolize_names: true)[:data]
    expect(routes).to be_a(Array)
  end
end
