require 'rails_helper'

RSpec.describe "logout", type: :feature do
  it "can logout" do
    visit root_path
    click_on "Register for new account"
    expect(current_path).to eq(new_user_path)

    within("#registration_form"){fill_in(:name, with: "George")}
    within("#registration_form"){fill_in(:email, with: "George@email")}
    within("#registration_form"){fill_in(:password, with: "1234")}
    within("#registration_form"){fill_in(:password_confirmation, with: "1234")}

    click_on "Create Account"

    expect(current_path).to eq(root_path)
    click_on "Login"
    within("#login_form"){fill_in(:email, with: "George@email")}
    within("#login_form"){fill_in(:password, with: "1234")}
    within("#login") do
      click_on "Login"
    end
    expect(current_path).to eq(root_path)
    click_on "Logout"
    expect(page).to have_content("Login")
    expect(page).to have_content("Register for new account")
  end
end