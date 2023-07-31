class Users::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    market_ids = current_user.favorites
    @favorite_markets = MarketService.new.fetch_favorite_markets(market_ids)
  end

  def create
    market_service = MarketService.new
    @market = market_service.one_market(params[:id].to_i)
    current_user.favorites << @market[:data][:id].to_i
    if current_user.save
      flash[:success] = 'Market added to favorites!'
    else
      flash[:alert] = 'Failed to add market to favorites.'
    end
    redirect_to market_path(@market[:data][:id])
  end

  def destroy
    market_service = MarketService.new
    @market = market_service.one_market(params[:id].to_i)
    current_user.favorites.delete(@market[:data][:id].to_i)
    if current_user.save
      flash[:success] = 'Market removed from favorites.'
    else
      flash[:alert] = 'Failed to remove market from favorites.'
    end
    redirect_to market_path(@market[:data][:id])
  end
end
