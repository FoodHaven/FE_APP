class RoutesController < ApplicationController
  def index
    @market = MarketFacade.new(params)
    location = Geocoder.search(@market.market.address)
    params[:latitude] = location.first.coordinates[0]
    params[:longitude] = location.first.coordinates[1]
    params[:original_lat] = params[:original_lat].to_f
    params[:original_lon] = params[:original_lon].to_f
    @routes = RouteFacade.new(params)
  end
end