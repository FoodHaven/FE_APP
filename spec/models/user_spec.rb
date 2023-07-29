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

  describe "self.from_omniauth" do
    it "creates a new user when user with uid and provider does not exist" do
      response = { uid: "12345", provider: "google", info: { name: "John Doe", email: "john@example.com" } }
      expect do
        User.from_omniauth(response)
      end.to change(User, :count).by(1)
    end
  end

  describe "uniqueness of :email" do
    let!(:existing_user) { create(:user, email: "existing@example.com") }

    it "is case-insensitive" do
      user = build(:user, email: "Existing@example.com")
      expect(user).to be_invalid
    end
  end
end

