require 'rails_helper'

RSpec.describe 'Favorites', type: :feature do
  let(:user) { create(:user, password: 'password', password_confirmation: 'password') }
  let(:market_id) { "123" }

  before do
    visit login_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Login'
  end

  it 'User can add a market to favorites' do
    market_data = {
      "id" => market_id,
      "type" => "market",
      "attributes" => {
        "name" => "Wolfeboro Area Farmers Market",
        "address" => "233 South Main St, Wolfeboro, New Hampshire 03894",
        "site" => "Local government building grounds;",
        "description" => "Across from Huggins, behind the Clark House Museum.",
        "fnap" => "SNAP;Accept EBT at a central location;;",
        "snap_option" => "Accept EBT at a central location;",
        "accepted_payment" => "Debit card/Credit card;",
        "longitude" => -71.202747,
        "latitude" => 43.580593
      }
    }

    stub_request(:get, "https://foodhaven-be.onrender.com/api/v1/markets/#{market_id}")
      .to_return(body: { data: market_data }.to_json, status: 200)

    visit market_path(market_id)

    click_button 'Add to Favorites'

    expect(page).to have_content('Market added to favorites!')

    user.reload

    expect(user.favorites).to include(123)
  end

  it 'User can remove a market from favorites' do
    market_data = {
      "id" => market_id,
      "type" => "market",
      "attributes" => {
        "name" => "Wolfeboro Area Farmers Market",
        "address" => "233 South Main St, Wolfeboro, New Hampshire 03894",
        "site" => "Local government building grounds;",
        "description" => "Across from Huggins, behind the Clark House Museum.",
        "fnap" => "SNAP;Accept EBT at a central location;;",
        "snap_option" => "Accept EBT at a central location;",
        "accepted_payment" => "Debit card/Credit card;",
        "longitude" => -71.202747,
        "latitude" => 43.580593
      }
    }

    stub_request(:get, "https://foodhaven-be.onrender.com/api/v1/markets/#{market_id}")
    .to_return(body: { data: market_data }.to_json, status: 200)

    user.favorites << market_id.to_i
    user.save

    visit market_path(market_id)

    click_button 'Remove from Favorites'
    user.reload

    expect(page).to have_content('Market removed from favorites.')
    expect(user.favorites).not_to include(123)
  end
end
