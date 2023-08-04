require 'rails_helper'

RSpec.describe "Application Landing Page", type: :feature do
  describe "landing page" do
    it "can see register & login buttons" do
      visit root_path
      expect(page).to have_button "Register for new account"
      expect(page).to have_button "Login"
    end

    it "find a market button" do
      visit root_path
      expect(page).to have_button "Find a market near you"
    end
  end
  describe "no login if logged in" do
    it "wont display to login if there is a current user" do
      visit root_path
      expect(page).to have_button "Register for new account"
      expect(page).to have_button "Login"
      expect(page).to have_button "Login with Google"
      click_on "Register for new account"
      expect(current_path).to eq(new_user_path)
  
      fill_in :name, with: "George"
      fill_in :email, with: "George@email.com"
      fill_in :password, with: "1234"
      fill_in :password_confirmation, with: "1234"
  
      click_on "Create Account"
      click_on "Login"
      expect(current_path).to eq(login_path)

      fill_in :email, with: "George@email.com"
      fill_in :password, with: "1234"

      within("#login") do
        click_on "Login"
      end
  
      expect(current_path).to eq(root_path)
      expect(page).to_not have_content("Log in")
      expect(page).to_not have_content("Register for new account")
    end
  end
end