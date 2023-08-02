class MarketsController < ApplicationController
  def search
  end

  def index
    if params[:latitude] && params[:longitude]
      market_facade = MarketFacade.new(params)
      @markets = market_facade.all_markets
      @nearby_markets = market_facade.nearby_markets
    else
      location = Geocoder.search(params[:zip])
      params[:latitude] = location.first.coordinates[0]
      params[:longitude] = location.first.coordinates[1]
      params[:radius] = params[:radius].to_f
      @markets = MarketFacade.new(params).all_markets
      @nearby_markets = MarketFacade.new(params).nearby_markets
    end
  end

  def show
    params[:id] = params[:id].to_i
    @market = MarketFacade.new(params)
  end
end