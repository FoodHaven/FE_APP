class MarketsController < ApplicationController
  def index
    if params[:use_my_location] != "0"
      location = Geocoder.search(params[:use_my_location])
    end

    location = Geocoder.search(params[:search])
    params[:latitude] = location.first.coordinates[0]
    params[:longitude] = location.first.coordinates[1]
    params[:radius] = params[:radius].to_f
    response = Faraday.get("https://foodhaven-be.onrender.com/api/v1/markets", params)
    @markets = JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def show
    response = Faraday.get("https://foodhaven-be.onrender.com/api/v1/markets/#{params[:id]}")
    @market = JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def search
  end
end