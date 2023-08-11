class RouteFacade
  attr_reader :latitude, :longitude, :original_lat, :original_lon, :global_route_id
  def initialize(params)
    @original_lat = params[:original_lat]
    @original_lon = params[:original_lon]
    @destination_lat = params[:latitude]
    @destination_lon = params[:longitude]
    @id = params[:market_id].to_i
    @global_id = params[:id]
  end

  def all_routes
    response = service.all_routes(@original_lat, @original_lon, @destination_lat, @destination_lon)
    itineraries = response['plan']['itineraries']

    itineraries.flat_map do |itinerary|
      itinerary['legs'].select { |leg| leg['agencyName'] }.map do |leg|
        Route.new(leg)
      end
    end
  end

  def single_route
    response = service.one_route(@global_id)
    return [] unless response[:data]

    response[:data].map do |data|
      data[:attributes][:stops].map do |stop|
        RouteStop.new(stop)
      end
    end
  end

  def service
    RouteService.new
  end
end