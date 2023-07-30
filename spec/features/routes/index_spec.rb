require "rails_helper"
RSpec.describe "Routes" do
  it "can find routes for market" do
    json_response = File.read('spec/fixtures/transit_search.json')
    destination_lat = 40.77709768562554
    destination_lon = -73.87400881765025
    original_lat = 40.748594902847515
    original_lon =  -73.98564294463469
    request = stub_request(:get, "http://localhost:3001/api/v1/markets/2/transit_routes?fromPlace=#{original_lat},#{original_lon}&toPlace=#{destination_lat},#{destination_lon}")
    routes = JSON.parse(json_response, symbolize_names: true)[:data]
    expect(routes).to be_a(Array)
  end
end k