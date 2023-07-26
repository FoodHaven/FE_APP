require 'rails_helper'

RSpec.describe "Users Facade" do
  describe "Users Search" do
    it "gets all users" do
      json_response = File.read('spec/fixtures/user_search_data.json')
      stub_request(:get, "https://foodhaven-be.onrender.com/api/v1/users").
        to_return(status: 200, body: json_response)
      data = JSON.parse(json_response, symbolize_names: true)
      @users = UserSearch.new.all_users

      expect(@users).to be_a Array
      expect(@users.count).to eq 2
    end

    it "gets one user" do
      json_response = File.read('spec/fixtures/one_user_data.json')
      stub_request(:get, "https://foodhaven-be.onrender.com/api/v1/users/1").
        to_return(status: 200, body: json_response)
      data = JSON.parse(json_response, symbolize_names: true)
      user_data = data[:data].first
      @user = UserSearch.new.one_user(1)

      expect(@user).to be_a User
      expect(@user.name).to be_a String
      expect(@user.email).to be_a String
      expect(@user.city).to be_a String
      expect(@user.state).to be_a String
      expect(@user.zip).to be_a Integer
      expect(@user.password).to be_a String
    end
  end
end