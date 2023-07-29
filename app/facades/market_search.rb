class MarketSearch
  def initialize(params)
    @latitude = params[:latitude]
    @longitude = params[:longitude]
    @radius = params[:radius]
    @id = params[:id]
    require 'pry'; binding.pry
  end
  def all_markets
    service.all_markets(@latitude, @longitude, @radius)[:data].map do |data|
      Market.new(data[:attributes])
    end
  end

  def market
    Market.new(service.one_market(@id))
    require 'pry'; binding.pry
  end

  def service
    MarketService.new
  end

end