class MarketsController < ApplicationController
  def search
  end

  def index
    if params[:original_lat] != "" && params[:original_lon] != ""
      @markets = MarketFacade.new(params).all_markets
    else
      address_format
      coordinates = CoordinatesFacade.new(params[:address]).coordinates
      params[:original_lat] = coordinates[0].latitude
      params[:original_lon] = coordinates[0].longitude
      @markets = MarketFacade.new(params).all_markets
    end
  end

  def show
    @market = MarketFacade.new(params).market
  end
end
