class FarmersMarketsController < ApplicationController
  def index
    @markets = FarmersMarket.all
  end

  def show
    @market = FarmersMarket.find(params[:id])
  end
end