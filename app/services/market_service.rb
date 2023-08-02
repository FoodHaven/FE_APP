class MarketService
  def conn
    Faraday.new(url: "https://foodhaven-be.onrender.com")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def all_markets(latitude, longitude, radius)
    get_url("/api/v1/markets/nearby?latitude=#{latitude}&longitude=#{longitude}&radius=#{radius}").map do |data|
      Market.new({ id: data[:id], type: 'market', attributes: data })
    end
  end
  
  def one_market(id)
    get_url("/api/v1/markets/#{id}")
  end

  def fetch_favorite_markets(market_ids)
    market_ids_param = market_ids.map { |id| "market_ids[]=#{id}" }.join('&')
    get_url("/api/v1/favorites?#{market_ids_param}")
  end

  def self.nearby_markets(latitude, longitude, radius)
    uri = URI.parse("http://backend_service_url/api/v1/markets/nearby?latitude=#{latitude}&longitude=#{longitude}&radius=#{radius}")

    response = Net::HTTP.get_response(uri)
    if response.code == '200'
      JSON.parse(response.body)
    else
      []
    end
  end
end