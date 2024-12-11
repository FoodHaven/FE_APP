class MarketFacade
  attr_reader :id, :market_id, :original_lat, :original_lon, :radius
  def initialize(params)
    @latitude = params[:original_lat]
    @longitude = params[:original_lon]
    @radius = params[:radius]
    @id = params[:id].to_i || params[:market_id].to_i
  end
  
  def all_markets
    service.all_markets(@latitude, @longitude, @radius)[:data].map do |data|
      Market.new(data)
    end
  end

  def market
    Market.new(service.one_market(@id)[:data])
  end

  def service
    MarketService.new
  end

end
