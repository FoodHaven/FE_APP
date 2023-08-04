require 'rails_helper'

RSpec.describe "logout", type: :feature do
  it "can logout" do
    visit root_path
    click_on "Register for new account"
    expect(current_path).to eq(new_user_path)

    fill_in :Name, with: "Bob"
    fill_in :email, with: "Bob@email.com"
    fill_in :password, with: "1234"
    fill_in :password_confirmation, with: "1234"

    click_on "Create Account"
    visit root_path
    click_on "Login"
    fill_in :email, with: "Bob@email.com"
    fill_in :password, with: "1234"
    click_on "Login"

    click_on "Logout"
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Login")
    expect(page).to have_content("Register for new account")
  end
end