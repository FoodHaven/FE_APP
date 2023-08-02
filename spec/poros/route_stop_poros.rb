require 'rails_helper'

RSpec.describe RouteStop, type: :poro do
  let(:route_data) do
    {
      stop_lat: 12345
      stop_lon: 54321
      stop_name: "Stops here"
      wheelchair_boarding: 1
      model_name: "Bus"
      route_name: "Route 123 Bus"
    }
  end

  it 'can be initialized with data' do
    route = Route.new(route_data)
    
    expect(route.stop_lat).to eq(12345)
    expect(route.stop_lon).to eq(54321)
    expect(route.stop_name).to eq("Stops here")
    expect(route.wheelchair_boarding).to eq(1)
    expect(route.model_name).to eq("Bus")
    expect(route.route_name).to eq("Route 123 Bus")
  end
end


      
      