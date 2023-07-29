require "rails_helper"

RSpec.describe "Market show page" do
  it "can display link to show page" do
    json_response = File.read('spec/fixtures/markets.json')
    latitude = 30.69035
    longitude = 88.045015
    radius = 5
    params = latitude, longitude, radius
    stub_request(:get, "https://foodhaven-be.onrender.com/api/v1/markets/2")
    markets = JSON.parse(json_response, symbolize_names: true)[:data]
    expect(markets.first).to be_a(Hash)
    expect(markets.first[:attributes][:name]).to eq("Market in The Park")
    expect(markets.first[:attributes][:address]).to eq("300 Conti, Mobile, Alabama 36602")
    expect(markets.first[:attributes][:site]).to eq("Local government building grounds;")
    expect(markets.first[:attributes][:description]).to eq("Cathedral Square, located in downtown Mobile, bordered by Conti, Jackson, Dauphin, and Claiborne Streets.")
    expect(markets.first[:attributes][:fnap]).to eq("Senior Farmers Market Nutrition Program;")
    expect(markets.first[:attributes][:accepted_payment]).to eq("Debit card/Credit card;")
  end
end