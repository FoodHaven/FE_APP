require 'rails_helper'

RSpec.describe 'Favorites', type: :feature do
  let(:user) { create(:user) }
  let(:market) {
    Market.new(
      listing_id: 1,
      listing_name: "Test Market",
      location_address: "123 Test St.",
      location_description: "Description",
      location_site: "Site",
      acceptedpayment: "Payment",
      FNAP: "FNAP",
      SNAP_option: "SNAP"
    )
  }

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  it 'User can add a market to favorites' do
    market_data = {
      id: market.id,
      listing_name: market.name,
      location_address: market.address,
      location_description: market.location_description,
      location_site: market.site_description,
      acceptedpayment: market.payment,
      FNAP: market.FNAP,
      SNAP_option: market.SNAP
    }

    stub_request(:get, "https://foodhaven-be.onrender.com/api/v1/markets/#{market.id}")
    .to_return(body: market_data.to_json, status: 200)

    visit market_path(market.id)

    click_button 'Add to Favorites'

    expect(page).to have_content('Market added to favorites!')
    expect(user.favorites).to include(market.id)
  end

  it 'User can remove a market from favorites' do
    market_data = {
      id: market.id,
      listing_name: market.name,
      location_address: market.address,
      location_description: market.location_description,
      location_site: market.site_description,
      acceptedpayment: market.payment,
      FNAP: market.FNAP,
      SNAP_option: market.SNAP
    }

    stub_request(:get, "https://foodhaven-be.onrender.com/api/v1/markets/#{market.id}")
    .to_return(body: market_data.to_json, status: 200)

    user.favorites << market.id
    visit market_path(market.id)

    click_button 'Remove from Favorites'

    expect(page).to have_content('Market removed from favorites.')
    expect(user.favorites).not_to include(market.name)
  end
end
