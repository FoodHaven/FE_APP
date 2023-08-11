class FarmersMarkets::SearchController < ApplicationController
  def index
    @markets = FarmersMarket.nearby_markets(coordinates, params[:radius])
  end

  private
  def coordinates
    [params[:latitude], params[:longitude]]
  end
end