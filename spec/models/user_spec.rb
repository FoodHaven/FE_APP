require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should have_secure_password }
  end

  describe "favorites attribute" do
    let(:user) { User.new(name: "John Doe", email: "john@example.com", password: "password") }

    it "can store an array of market IDs as favorites" do
      user.favorites = [1, 2, 3]
      expect(user.favorites).to eq([1, 2, 3])
    end

    it "can add a market ID to favorites" do
      user.favorites << 4
      expect(user.favorites).to eq([4])
    end

    it "can remove a market ID from favorites" do
      user.favorites = [1, 2, 3, 4]
      user.favorites.delete(3)
      expect(user.favorites).to eq([1, 2, 4])
    end
  end

  it "creates or updates itself from an oauth hash" do
    auth = {
      provider: "google_oauth2",
      uid: "12345678910",
      info: {
        email: "user@email.com",
        name: "User",
      }
    }
    User.from_omniauth(auth)
    new_user = User.first
    expect(new_user.provider).to eq("google_oauth2")
    expect(new_user.uid).to eq("12345678910")
    expect(new_user.email).to eq("user@email.com")
    expect(new_user.name).to eq("User")
  end
  
  describe "uniqueness of :email" do
    let!(:existing_user) { create(:user, email: "existing@example.com") }
    
    it "is case-insensitive" do
      user = build(:user, email: "Existing@example.com")
      expect(user).to be_invalid
    end
  end
end

