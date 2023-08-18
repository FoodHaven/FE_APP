class MarketsController < ApplicationController
  def search
  end

  def index
    if params[:latitude] != "" && params[:longitude] != ""
      @markets = MarketFacade.new(params).all_markets
    else
      address_format
      coordinates = CoordinatesFacade.new(params[:address]).coordinates
      params[:latitude] = coordinates[0].latitude
      params[:longitude] = coordinates[0].longitude
      @markets = MarketFacade.new(params).all_markets
    end
  end

  def show
    @market = MarketFacade.new(params).market
  end

  private

  def address_format
    params[:address] = "#{params[:street]}, #{params[:city]}, #{params[:state]} #{params[:zipcode]}"
  end
end
