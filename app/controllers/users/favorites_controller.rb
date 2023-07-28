# app/controllers/users/favorites_controller.rb
class Users::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @market = Market.find(params[:market_id])
    current_user.favorites << @market.id
    if current_user.save
      redirect_to @market, notice: 'Market added to favorites!'
    else
      redirect_to @market, alert: 'Something went wrong while adding to favorites.'
    end
  end

  def destroy
    @market = Market.find(params[:market_id])
    current_user.favorites.delete(@market.id)
    if current_user.save
      redirect_to @market, notice: 'Market removed from favorites.'
    else
      redirect_to @market, alert: 'Something went wrong while removing from favorites.'
    end
  end
end
