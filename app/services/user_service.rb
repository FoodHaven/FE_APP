class UserService
  def conn
    Faraday.new(url: "https://foodhaven-be.onrender.com")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def all_users
    get_url("/api/v1/users")
  end

  def one_user(id)
    get_url("/api/v1/users/#{id}")
  end
end