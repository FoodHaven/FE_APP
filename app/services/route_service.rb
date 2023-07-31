class RouteService
  def conn
    Faraday.new(url: "http://localhost:3001")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def all_routes(id, original_lat, original_lon, destination_lat, destination_lon)
    get_url("/api/v1/markets/#{id}/transit_routes?original_lat=#{original_lat}&original_lon=#{original_lon}&destination_lat=#{destination_lat}&destination_lon=#{destination_lon}")
  end
end