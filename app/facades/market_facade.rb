class MarketFacade
  attr_reader :id
  def initialize(params)
    @latitude = params[:latitude]
    @longitude = params[:longitude]
    @radius = params[:radius]
    @id = params[:id]
  end
  def all_markets
    service.all_markets(@latitude, @longitude, @radius).map do |data|
      Market.new(data)
    end
  end

  def market
    Market.new(service.one_market(@id))
  end

  def service
    MarketService.new
  end

end