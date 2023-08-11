class MarketsController < ApplicationController
  def search
  end

  def index
    if params[:latitude] != "" && params[:longitude] != ""
      @markets = FarmersMarket.nearby_markets(coordinates, params[:radius])
    else
      geolocate_by_zip
      @markets = FarmersMarket.nearby_markets(coordinates, params[:radius])
    end
  end

  def show
    @market = FarmersMarket.find(params[:id])
  end

  private

  def geolocate_by_zip 
    location = Geocoder.search(params[:zip])
    params[:latitude] = location.first.data['lat']
    params[:longitude] = location.first.data['lon']
  end

  def coordinates
    [params[:latitude], params[:longitude]]
  end
end
