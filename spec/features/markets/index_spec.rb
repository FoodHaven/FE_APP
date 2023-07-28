require "rails_helper"

RSpec.describe "Find markets" do
  it "Can find markets" do
    visit root_path
    click_on "Find a market near you"
    expect(current_path).to eq(markets_search_path)

    fill_in :search, with: ""
  end
end