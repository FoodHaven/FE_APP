class MarketsController < ApplicationController
  def search
  end

  def index
    if params[:latitude] && params[:longitude]
      @markets = MarketFacade.new(params).all_markets
    else
      geolocate_by_zip
      @markets = MarketFacade.new(params)
    end
  end

  def show
    @market = MarketFacade.new(params).market
  end
end