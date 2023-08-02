class RouteStop
  attr_reader :stop_lat, :stop_lon, :wheelchair_boarding, :departure_time, :headsign, :stop_name, :next_departure
  def initialize(data)
    @stop_name = data[:stop_name]
    @headsign = data[:headsign]
    @stop_lat = data[:stop_lat]
    @stop_lon = data[:stop_lon]
    @stop_name = data[:stop_name]
    @wheelchair_boarding = data[:wheelchair_boarding]
    @departure_time = data[:next_departure][:scheduled_departure_time]
  end
end
    