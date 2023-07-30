class RoutesController < ApplicationController
  def index
    @market = MarketFacade.new(params)
    location = Geocoder.search(@market.market.address)
    params[:latitude] = location.first.coordinates[0]
    params[:longitude] = location.first.coordinates[1]
    @routes = RouteFacade.new(params)
  end
end