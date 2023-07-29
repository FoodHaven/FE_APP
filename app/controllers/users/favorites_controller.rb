class Users::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    market_service = MarketService.new
    @market = market_service.find_market(params[:id])
    current_user.favorites << @market.name
    flash[:success] = 'Market added to favorites!'
    redirect_to market_path(@market.id)
  end

  def destroy
    market_service = MarketService.new
    @market = market_service.find_market(params[:id])
    current_user.favorites.delete(@market.name)
    flash[:success] = 'Market removed from favorites.'
    redirect_to market_path(@market.name)
  end
end
