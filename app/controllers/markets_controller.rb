class MarketsController < ApplicationController
  def search
  end

  def index
    location = Geocoder.search(params[:search])
    params[:latitude] = location.first.coordinates[0]
    params[:longitude] = location.first.coordinates[1]
    params[:radius] = params[:radius].to_f
    @markets = MarketSearch.new(params)
  end

  def show
    # response = Faraday.get("https://foodhaven-be.onrender.com/api/v1/markets/#{params[:id]}")
    # @market = JSON.parse(response.body, symbolize_names: true)[:data]
    @market = MarketSearch.new(params)
  end
end