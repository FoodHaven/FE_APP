class FarmersMarkets::SearchController < ApplicationController
  def index
    markets = FarmersMarket.nearby_markets(coordinates, params[:radius])
    render json: FarmersMarketSerializer.new(markets)
  end

  private
  def coordinates
    [params[:latitude], params[:longitude]]
  end
end