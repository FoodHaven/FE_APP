require "rails_helper"

RSpec.describe "User Service" do
  it "has route to search all user data" do
    json_response = File.read('spec/fixtures/user_search_data.json')
    stub_request(:get, "https://foodhaven-be.onrender.com/api/v1/users").
      to_return(status: 200, body: json_response)
    data = JSON.parse(json_response, symbolize_names: true)
    @users = data[:data]
    expect(data).to be_a(Hash)
    @users.each do |user|
      expect(user).to have_key(:name)
      expect(user[:name]).to be_a(String)

      expect(user).to have_key(:email)
      expect(user[:email]).to be_a(String)

      expect(user).to have_key(:city)
      expect(user[:city]).to be_a(String)

      expect(user).to have_key(:state)
      expect(user[:state]).to be_a(String)

      expect(user).to have_key(:zip)
      expect(user[:zip]).to be_a(Integer)

      expect(user).to have_key(:password)
      expect(user[:password]).to be_a(String)
    end
  end

  it "has route to search one user data" do
    json_response = File.read('spec/fixtures/one_user_data.json')
    stub_request(:get, "https://foodhaven-be.onrender.com/api/v1/users/1").
      to_return(status: 200, body: json_response)
    data = JSON.parse(json_response, symbolize_names: true)
    @user = data[:data].first

    expect(@user).to have_key(:name)
    expect(@user[:name]).to be_a(String)

    expect(@user).to have_key(:email)
    expect(@user[:email]).to be_a(String)

    expect(@user).to have_key(:city)
    expect(@user[:city]).to be_a(String)

    expect(@user).to have_key(:state)
    expect(@user[:state]).to be_a(String)

    expect(@user).to have_key(:zip)
    expect(@user[:zip]).to be_a(Integer)

    expect(@user).to have_key(:password)
    expect(@user[:password]).to be_a(String)
  end
end