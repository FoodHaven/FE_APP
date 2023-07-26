require 'rails_helper'

RSpec.describe "Users API Service Calls" do
  describe "Users Api calls" do
    it "gets all users" do
      json_response = File.read('spec/fixtures/user_search_data.json')
      stub_request(:get, "https://foodhaven-be.onrender.com/api/v1/users").
        to_return(status: 200, body: json_response)
      data = JSON.parse(json_response, symbolize_names: true)
      @users = data[:data]
      @user1 = User.new(@users.first)
      @user2 = User.new(@users.last)

      expect(@users.count).to eq 2
      expect(@user1.name).to  eq "Bilbo"
      expect(@user2.name).to  eq "Wilbo"
    end

    it "gets one user" do
      json_response = File.read('spec/fixtures/one_user_data.json')
      stub_request(:get, "https://foodhaven-be.onrender.com/api/v1/users/1").
        to_return(status: 200, body: json_response)
      data = JSON.parse(json_response, symbolize_names: true)
      @user = User.new(data[:data].first)

      expect(@user.name).to  eq "Bilbo"
      expect(@user.email).to eq "BilboBobs@email.email"
      expect(@user.city).to eq "Hobbiton"
      expect(@user.state).to eq "Shire"
      expect(@user.zip).to eq 45678
      expect(@user.password).to eq "goldrings"
    end
  end
end