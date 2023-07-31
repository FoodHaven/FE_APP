require 'rails_helper'

RSpec.describe "Routes" do

  it "can find routes for market", :vcr do
    destination_lat = 40.77709768562554
    destination_lon = -73.87400881765025
    original_lat = 40.748594902847515
    original_lon = -73.98564294463469
    id = 2212

    response = RouteService.new.all_routes(id, original_lat, original_lon, destination_lat, destination_lon)

    expect(response).to be_an(Array)
    expect(response[0]).to have_key(:agency_name)
    expect(response[0]).to have_key(:route_short_name)
    expect(response[0]).to have_key(:headsign)
    expect(response[0]).to have_key(:start_time)
    expect(response[0]).to have_key(:end_time)
  end
end
