class RouteService
  def conn
    Faraday.new(url: 'https://external.transitapp.com') do |f|
      f.headers['apiKey'] = ENV['transit_api_key']
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def all_routes(original_lat, original_lon, destination_lat, destination_lon)
    get_url("/v3/otp/plan?fromPlace=#{original_lat},#{original_lon}&toPlace=#{destination_lat},#{destination_lon}")
  end

  def one_route(id)
    get_url("/v3/public/route_details?global_route_id=#{id}&include_next_departure=true")
  end
end