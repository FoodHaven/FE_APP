class MarketsController < ApplicationController
  def index
    response = Faraday.get("http://localhost:3001/api/v1/markets/")
    @markets = JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def search
  end
end