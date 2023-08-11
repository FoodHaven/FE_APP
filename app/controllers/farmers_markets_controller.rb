class FarmersMarketsController < ApplicationController
  def index
    markets = FarmersMarket.all
    render json: FarmersMarketSerializer.new(markets)
  end

  def show
    market = FarmersMarket.find(params[:id])
    render json: FarmersMarketSerializer.new(market)
  end
end