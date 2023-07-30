class RouteService
  def conn
    Faraday.new(url: "https://foodhaven-be.onrender.com")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def all_routes(original_lat, original_lon, destination_lat, destination_lon)
    get_url("/api/v1/markets/:market_id/routes?fromplace=#{original_lat},#{original_lon}&toPlace=#{destination_lat},#{destination_lon}")
  end
end