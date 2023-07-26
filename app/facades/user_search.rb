class UserSearch
  def all_users
    service = UserService.new
    request = service.all_users
    @users = request[:data].map do |u|
      User.new(u)
    end
  end

  def one_user(id)
    service = UserService.new
    request = service.one_user(id)
    @user = User.new(request[:data].first)
  end
end