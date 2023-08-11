class FarmersMarkets::FavoritesController < ApplicationController
  def index
    render json: FarmersMarketSerializer.new(FarmersMarket.find(params[:market_ids]))
  end
end