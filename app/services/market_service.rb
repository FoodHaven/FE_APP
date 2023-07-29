
  def all_markets
    get_url("/api/v1/markets")
  end

  def find_market(id)
    url = "/api/v1/markets/#{id}"
    get_url(url)
  end
end