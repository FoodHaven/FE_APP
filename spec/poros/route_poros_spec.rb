require 'rails_helper'

RSpec.describe Route, type: :model do
  describe 'create transit route object' do
    it 'has transit route attributes' do
      data = {
        agencyName: "RTD",
        routeShortName: "225",
        headsign: "Downtown Denver",
        startTime: "2020-09-01T05:00:00",
        endTime: "2020-09-01T05:30:00"
      }
      route = Route.new(data)

      expect(route).to be_a(Route)
      expect(route.agency_name).to eq("RTD")
      expect(route.route_short_name).to eq("225")
      expect(route.headsign).to eq("Downtown Denver")
      expect(route.start_time).to eq("2020-09-01T05:00:00")
      expect(route.end_time).to eq("2020-09-01T05:30:00")
    end
  end
end
