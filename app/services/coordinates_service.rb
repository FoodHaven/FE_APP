class CoordinatesService
  def conn
    Faraday.new(url: "https://maps.googleapis.com/maps/api/geocode/json")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def coordinates(address)
    get_url("?address=#{address}&key=#{Figaro.env.maps_api}")
  end
end