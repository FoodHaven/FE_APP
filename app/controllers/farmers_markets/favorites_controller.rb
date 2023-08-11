class FarmersMarkets::FavoritesController < ApplicationController
  def index
    render json: MarketSerializer.new(Market.find(params[:market_ids]))
  end
end