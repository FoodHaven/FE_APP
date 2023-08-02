require 'rails_helper'

RSpec.describe RouteFacade, type: :model do
  describe "instance methods" do
    it "initializes with attributes" do
      params = {
        original_lat: "original_lat",
        original_lon: "original_lon",
        latitude: "latitude",
        longitude: "longitude",
        market_id: "1",
        global_id: "MTABC:33875"
      }
      route_facade = RouteFacade.new(params)

      expect(route_facade.original_lat).to eq(params[:original_lat])
      expect(route_facade.original_lon).to eq(params[:original_lon])
      expect(route_facade.id).to eq(params[:market_id].to_i)
    end

    it "#all_routes" do
      params = {
        original_lat: "original_lat",
        original_lon: "original_lon",
        latitude: "latitude",
        longitude: "longitude",
        market_id: "1"
      }
      route_facade = RouteFacade.new(params)

      expect(RouteService).to receive(:new).and_return(double(all_routes: [{}]))
      expect(Route).to receive(:new).with({})

      route_facade.all_routes
    end

    xit "#single_route" do
      params = {
        id: "MTABC:33875"
      }
      route_facade = RouteFacade.new(params)
      
      route = route_facade.single_route
    end

    it "#service" do
      params = {
        original_lat: "original_lat",
        original_lon: "original_lon",
        latitude: "latitude",
        longitude: "longitude",
        market_id: "1",
        id: "MTABC:33875"
      }
      route_facade = RouteFacade.new(params)

      expect(route_facade.service).to be_a(RouteService)
    end
  end
end