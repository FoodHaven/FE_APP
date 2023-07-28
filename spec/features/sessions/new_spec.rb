require "rails_helper"

RSpec.describe "log in" do
  it "can log in" do
    visit root_path
    click_on "Register for new account"
    expect(current_path).to eq(new_user_path)

    fill_in :name, with: "Bob"
    fill_in :email, with: "Bob@email.com"
    fill_in :password, with: "1234"
    fill_in :password_confirmation, with: "1234"

    click_on "Create Account"

    visit root_path
    click_on "Login"
    expect(current_path).to eq(login_path)

    fill_in :email, with: "Bob@email.com"
    fill_in :password, with: "1234"

    click_on "Login"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome, Bob")

  end
end