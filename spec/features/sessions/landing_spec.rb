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
      expect(page).to have_button "Find a Market"
    end
  end
end