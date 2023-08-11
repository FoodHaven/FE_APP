require 'rails_helper'

RSpec.describe RouteService do
  describe '#all_routes' do
    it 'fetches all routes', :vcr do
      service = RouteService.new
      id = 1
      original_lat = 40.0150
      original_lon = -105.2705
      destination_lat = 39.8367
      destination_lon = -105.0372

      response = service.all_routes(original_lat, original_lon, destination_lat, destination_lon)

      expect(response).to be_a(Hash)
      expect(response[:plan]).to be_a(Hash)
      expect(response[:plan][:itineraries]).to be_an(Array)
    end
  end

  describe "#route_details" do
    it "gets details of a route", :vcr do
      route_service = RouteService.new

      id = "RTD:62467"

      response = route_service.one_route(id)

      expect(response).to be_a(Hash)
      expect(response[:itineraries][0][:stops][0][:stop_name]).to eq("Downtown Boulder Station Gate 1")
    end
  end
end
