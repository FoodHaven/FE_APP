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
  end
end
end