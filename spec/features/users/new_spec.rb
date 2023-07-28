require "rails_helper"

RSpec.describe "Register" do
  it "Can register new user" do
    visit root_path
    click_on "Register for new account"
    expect(current_path).to eq(new_user_path)

    fill_in :name, with: "Bob"
    fill_in :email, with: "Bob@email.com"
    fill_in :password, with: "1234"
    fill_in :password_confirmation, with: "1234"

    click_on "Create Account"

    expect(current_path).to eq(root_path)
  end
  it "Can't register new user with bad credentials" do
    visit root_path
    click_on "Register for new account"
    expect(current_path).to eq(new_user_path)

    fill_in :name, with: "Bob"
    fill_in :email, with: "Bob@email.com"
    fill_in :password, with: "1234"
    fill_in :password_confirmation, with: "1"

    click_on "Create Account"

    expect(current_path).to eq(new_user_path)
    expect(page).to have_content("Name, Email, and password must be valid")
  end
end