RSpec.describe "Routes index page" do
  it "can find routes for market", :vcr do
    destination_lat = 40.77709768562554
    destination_lon = -73.87400881765025
    original_lat = 40.748594902847515
    original_lon = -73.98564294463469
    market_id = 2212

    visit "/markets/#{market_id}/routes?original_lat=#{original_lat}&original_lon=#{original_lon}&destination_lat=#{destination_lat}&destination_lon=#{destination_lon}"
    expect(page).to have_content("Terminals C / B")
    expect(page).to have_content("Q70-SBS")
    expect(page).to have_content("MTA Bus Company")
  end

  it "doesn't show routes if unavailable", :vcr do
    visit market_routes_path(1)
    expect(page).to have_content("No routes found")
  end
end
