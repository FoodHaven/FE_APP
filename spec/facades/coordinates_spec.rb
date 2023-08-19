require "rails_helper"

RSpec.describe CoordinatesFacade, type: :model do
  describe "#coordinates" do
    it "can return coordinates by address", :vcr do 
      address = "6715 W Colfax Ave, Lakewood, CO 80214"
      coordinates = CoordinatesFacade.new(address).coordinates
      expect(coordinates[0]).to be_a(Object)
      expect(coordinates[0].latitude).to eq(39.7417639)
      expect(coordinates[0].longitude).to eq(-105.070705)
    end
  end
end
