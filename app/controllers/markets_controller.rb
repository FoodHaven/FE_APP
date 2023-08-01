class MarketsController < ApplicationController
  def search
  end

  def index
    if params[:latitude] && params[:longitude]
      @markets = MarketFacade.new(params)
    else
      location = Geocoder.search(params[:zip])
      params[:latitude] = location.first.coordinates[0]
      params[:longitude] = location.first.coordinates[1]
      params[:radius] = params[:radius].to_f
      @markets = MarketFacade.new(params)
    end
  end

  def show
    params[:id] = params[:id].to_i
    @market = MarketFacade.new(params)
  end
end