class MarketSearch
  def all_markets
    service = MarketSearch.new
    request = service.all_markets
    @markets = request[:data].map do |mark|
      Market.new(mark)
    end
  end
end