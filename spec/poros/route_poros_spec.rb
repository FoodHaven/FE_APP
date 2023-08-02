require 'rails_helper'

RSpec.describe Route, type: :poro do
  let(:route_data) do
    {
      agency_name: 'Agency Name',
      route_short_name: 'Route 123',
      headsign: 'Head Sign',
      start_time: '10:00 AM',
      end_time: '11:30 AM'
      global_route_id: "Special route"
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

    expect(route.agency_name).to eq('Agency Name')
    expect(route.route_short_name).to eq('Route 123')
    expect(route.headsign).to eq('Head Sign')
    expect(route.start_time).to eq('10:00 AM')
    expect(route.end_time).to eq('11:30 AM')
    expect(route.global_route_id).to eq("Special route")
    expect(route.stop_lat).to eq(12345)
    expect(route.stop_lon).to eq(54321)
    expect(route.stop_name).to eq("Stops here")
    expect(route.wheelchair_boarding).to eq(1)
    expect(route.model_name).to eq("Bus")
    expect(route.route_name).to eq("Route 123 Bus")
  end
end
