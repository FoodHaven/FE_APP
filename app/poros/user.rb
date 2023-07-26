class User
  attr_reader :id, :name, :email, :city, :state, :zip, :password
  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @email = data[:email]
    @city = data[:city]
    @state = data[:state]
    @zip = data[:zip]
    @password = data[:password]
  end
end