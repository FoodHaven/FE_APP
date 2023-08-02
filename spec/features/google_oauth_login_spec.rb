require "rails_helper"

RSpec.feature "user logs in" do
  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      provider: "google_oauth2",
      uid: "123456",
      info: {
        email: "user@gmail.com",
        name: "User",
      }
    })
  end

  scenario "using google oauth2" do
    stub_omniauth
    visit root_path
    expect(page).to have_button("Login with Google")
    click_on "Login with Google"
    expect(page).to have_button("Logout")
  end
end