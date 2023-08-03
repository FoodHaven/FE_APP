require 'rails_helper'

RSpec.describe RouteStop, type: :poro do
  describe "Route stop" do

    it 'can be initialized with data' do
      params = {
        stop_lat: 12345,
        stop_lon: 54321,
        stop_name: "Stops here",
        wheelchair_boarding: 1,
        next_departure: {
          scheduled_departure_time: "8:00"
        }
      }
      route = RouteStop.new(params)
      expect(route.stop_lat).to eq(12345)
      expect(route.stop_lon).to eq(54321)
      expect(route.wheelchair_boarding).to eq(1)
      expect(route.stop_name).to eq("Stops here")
      expect(route.departure_time).to eq("8:00")
    end
  end
end


      
      