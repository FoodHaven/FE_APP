class MarketsController < ApplicationController
  def search
  end

  def index
    if params[:latitude] && params[:longitude]
      @markets = MarketFacade.new(params).all_markets
    else
      geolocate_by_zip
      @markets = MarketFacade.new(params).all_markets
    end
  end

  def show
    @market = MarketFacade.new(params).market
  end

  private

  def geolocate_by_zip 
    location = Geocoder.search(params[:zip])
    params[:latitude] = location.first.data['lat']
    params[:longitude] = location.first.data['lon']
  end
end