class RouteFacade
  attr_reader :id, :latitude, :longitude
  def initialize(params)
    @origin_lat = params[:origin_lat]
    @origin_lat = params[:origin_lon]
    @destination_lat = params[:latitude]
    @destination_lon = params[:longitude]
  end
  def all_routes
    service.all_routes(@origin_lat, @origin_lon, @destination_lat, @destination_lon)[:data].map do |data|
      Route.new(data)
    end
  end

  def service
    RouteService.new
  end
end