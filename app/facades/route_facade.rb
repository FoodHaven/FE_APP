class RouteFacade
  attr_reader :id, :latitude, :longitude, :original_lat, :original_lon
  def initialize(params)
    @original_lat = params[:original_lat]
    @original_lon = params[:original_lon]
    @destination_lat = params[:latitude]
    @destination_lon = params[:longitude]
    @id = params[:market_id].to_i
  end
  def all_routes
    service.all_routes(@id, @original_lat, @original_lon, @destination_lat, @destination_lon).map do |data|
      Route.new(data)
    end
  end

  def service
    RouteService.new
  end
end