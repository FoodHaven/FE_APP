require 'rails_helper'

RSpec.describe "Routes show page" do

  describe "#route show page" do
  let(:route_service) { RouteService.new }

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
      visit market_route_path(1, id)
      expect(page).to have_content("Roosevelt Av / 61 St")
      expect(page).to have_content("Stop Lat: 40.74567731104018")
      expect(page).to have_content("Stop Lon: -73.90210722249947")
      expect(page).to have_content("Has Wheelchair Acessibility? Yes")
      expect(page).to have_content("Scheduled departure time:")
    end

    it "doesnt show route details if unavailable" do
      visit market_route_path(1, 2)
      expect(page).to have_content("No details for route available")
    end

  end
end