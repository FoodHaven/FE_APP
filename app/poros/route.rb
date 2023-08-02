class Route
  attr_reader :agency_name, :route_short_name, :headsign, :start_time, :end_time, :global_route_id
  def initialize(data)
    @agency_name = data[:agency_name]
    @route_short_name = data[:route_short_name]
    @headsign = data[:headsign]
    @start_time = data[:start_time]
    @end_time = data[:end_time]
    @global_route_id = data[:global_route_id]
  end
end