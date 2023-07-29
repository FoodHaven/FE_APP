class MarketsController < ApplicationController
  def index
  end

  def show
    market_service = MarketService.new
    @market = market_service.find_market(params[:id])
  end

  def search
  end
end