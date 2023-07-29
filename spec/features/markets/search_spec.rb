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
    visit root_path
    click_on "Find a market near you"
    fill_in :search, with: "Denver, Colorado"
    fill_in :radius, with: 15

    click_on "Search"
    expect(page).to have_content("Info")
  end
end