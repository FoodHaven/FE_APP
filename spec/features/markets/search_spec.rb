require "rails_helper"

RSpec.describe "Search for markets" do
  it "can link to find markets page" do
    visit root_path
    click_on "Find a market near you"
    expect(current_path).to eq(markets_search_path)
    expect(page).to have_content("Enter address")
    expect(page).to have_content("Within")
  end

  it "can search for market by address" do
    json_response = File.read('spec/fixtures/markets.json')
    latitude = 30.69035
    longitude = 88.045015
    radius = 5
    stub_request(:get, "https://foodhaven-be.onrender.com/api/v1/markets?latitude=#{latitude}&longitude=#{longitude}&radius=#{radius}")
    markets = JSON.parse(json_response, symbolize_names: true)[:data]
    expect(markets).to be_a(Array)
    expect(markets.count).to eq(22)
    expect(markets.first).to be_a(Hash)
    expect(markets.first[:attributes][:name]).to eq("Market in The Park")
    expect(markets.second[:attributes][:name]).to eq("Market in The Park - Lavretta Park")
  end

end