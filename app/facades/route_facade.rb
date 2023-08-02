class RouteFacade
  attr_reader :id, :latitude, :longitude, :original_lat, :original_lon, :global_route_id
  def initialize(params)
    @original_lat = params[:original_lat]
    @original_lon = params[:original_lon]
    @destination_lat = params[:latitude]
    @destination_lon = params[:longitude]
    @id = params[:market_id].to_i
    @global_id = params[:id]
  end
  def all_routes
    service.all_routes(@id, @original_lat, @original_lon, @destination_lat, @destination_lon).map do |data|
      Route.new(data)
    end
  end

  def single_route
    service.one_route(@global_id)[:data].map do |data|
      data[:attributes][:stops].map do |stop|
        RouteStop.new(stop)
      end
    end
  end

  def service
    RouteService.new
  end
end