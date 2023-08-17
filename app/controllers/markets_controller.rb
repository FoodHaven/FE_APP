class MarketsController < ApplicationController
  def search
  end

  def index
    if params[:latitude] != "" && params[:longitude] != ""
      @markets = MarketFacade.new(params).all_markets
    else
      address_format
      geolocate_by_address
      @markets = MarketFacade.new(params).all_markets
    end
  end

  def show
    @market = MarketFacade.new(params).market
  end

  private

  def address_format
    params[:address] = "#{params[:Street]}, #{params[:City]}, #{params[:State]} #{params[:Zip]}"
  end

  def geolocate_by_address
    location = Geocoder.search(params[:address])
    params[:latitude] = location.first.data['lat']
    params[:longitude] = location.first.data['lon']
  end
end
