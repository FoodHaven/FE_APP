require 'rails_helper'

RSpec.describe RouteService do
  let(:route_service) { RouteService.new }

  describe '#all_routes' do
    it 'fetches all transit routes for a market ID and coordinates' do
      market_id = 1
      original_lat = 40.7128
      original_lon = -74.0060
      destination_lat = 37.7749
      destination_lon = -122.4194


      stub_request(:get, "https://foodhaven-be.onrender.com/api/v1/markets/#{market_id}/transit_routes?original_lat=#{original_lat}&original_lon=#{original_lon}&destination_lat=#{destination_lat}&destination_lon=#{destination_lon}")
        .to_return(status: 200, body: '[{"name": "Route 1"}, {"name": "Route 2"}]', headers: { 'Content-Type' => 'application/json' })

      response = route_service.all_routes(market_id, original_lat, original_lon, destination_lat, destination_lon)

      expect(response).to be_an(Array)
      expect(response.size).to eq(2)
      expect(response[0][:name]).to eq('Route 1')
      expect(response[1][:name]).to eq('Route 2')
    end
  end
  
  describe "#route_details" do
    it "gets details of a route" do
      json_response = File.read('spec/fixtures/route_details.json')

      id = "MTABC:33875"
      stub_request(:get, "https://foodhaven-be.onrender.com/api/v1/route_details?global_route_id=#{id}").to_return(status: 200, body: json_response, headers: {})
      response = route_service.one_route(id)
      routes = JSON.parse(json_response, symbolize_names: true)

      expect(response).to be_an(Hash)
      expect(response[:data][0][:attributes][:stops][0][:stop_name]).to eq("Roosevelt Av / 61 St")
      expect(response[:data][0][:attributes][:stops][0][:stop_lat]).to eq(40.74567731104018)
      expect(response[:data][0][:attributes][:stops][0][:stop_lon]).to eq(-73.90210722249947)
    end
  end
end
