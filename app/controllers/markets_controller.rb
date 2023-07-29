class MarketsController < ApplicationController
  def search
  end

  def index
    location = Geocoder.search(params[:search])
    params[:latitude] = location.first.coordinates[0]
    params[:longitude] = location.first.coordinates[1]
    params[:radius] = params[:radius].to_f
    @markets = MarketFacade.new(params)
  end

  def show
    # market_service = MarketService.new
    # @market = market_service.find_market(params[:id])[:data]
    @market = MarketFacade.new(params)
  end
end