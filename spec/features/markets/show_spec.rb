require "rails_helper"

RSpec.describe "Market show page" do
  it "can display link to show page" do
    visit root_path
    click_on "Find a market near you"
    fill_in :search, with: "Denver, Colorado"
    fill_in :radius, with: 15

    click_on "Search"
    click_on "Landmark Greenwood Village Fresh Market"
    expect(page).to have_content("Landmark Greenwood Village Fresh Market")
    expect(page).to have_content("Address:")
    expect(page).to have_content("Find Route For:")
  end
end