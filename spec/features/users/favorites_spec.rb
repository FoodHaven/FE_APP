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
    stub_request(:get, "https://foodhaven-be.onrender.com/api/v1/markets/1").
    with(
      headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v2.7.10'
      }).
    to_return(status: 200, body: "", headers: {})
    visit market_path(market_id)

    click_button 'Remove from Favorites'
    user.reload

    expect(page).to have_content('Market removed from favorites.')
    expect(user.favorites).not_to include(123)
  end

  xit 'displays a list of favorite markets' do
    favorite_market1 = { id: 1, attributes: { name: 'Market 1' } }
    favorite_market2 = { id: 2, attributes: { name: 'Market 2' } }

    user.favorites << favorite_market1[:id]
    user.favorites << favorite_market2[:id]

    user.save

    stub_request(:get, "https://foodhaven-be.onrender.com/api/v1/favorites?market_ids[]=1&market_ids[]=2").
      to_return(status: 200, body: { data: [favorite_market1, favorite_market2] }.to_json, headers: { 'Content-Type' => 'application/json' })

    visit '/users/favorites'

    expect(page).to have_content('Favorite Markets')
    expect(page).to have_link('Market 1', href: market_path(favorite_market1[:id]))
    expect(page).to have_link('Market 2', href: market_path(favorite_market2[:id]))
  end
end