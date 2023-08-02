class MarketsController < ApplicationController
  def search
  end

  def index
    if params[:latitude] && params[:longitude]
      @markets = MarketFacade.new(params).all_markets
    else
      location = Geocoder.search(params[:zip])
      params[:latitude] = location.first.coordinates[0]
      params[:longitude] = location.first.coordinates[1]
      @markets = MarketFacade.new(params).all_markets
    end
  end

  def show
    @market = MarketFacade.new(params).market
  end
end