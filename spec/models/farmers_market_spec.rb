require 'rails_helper'

RSpec.describe FarmersMarket, type: :model do
  describe 'validations' 

  describe 'class methods' do 
    describe 'benefits' do 
      before(:each) do 
        create(:farmers_market, fnap: nil)
        create(:farmers_market, snap_option: nil)
        create(:farmers_market, fnap: nil, snap_option: nil)
        create(:farmers_market, fnap: nil, snap_option: nil)
        create(:farmers_market, snap_option: 'accepts')
        create(:farmers_market, snap_option: 'accepts', fnap: 'accepts')
      end

      it '::accepts_benefits' do 
        result = FarmersMarket.accepts_benefits
        expect(result.count).to eq(4) 
      end

      it '::snap_available' do 
        result = FarmersMarket.snap_available
        expect(result.count).to eq(3)
      end

      it '::fnap_available' do 
        result = FarmersMarket.fnap_available
        expect(result.count).to eq(3)
      end
    end

    describe 'proximity' do 
      it '::nearby_markets' do 
        market_1 = create(:farmers_market, longitude: -81.1478018, latitude: 36.1582212)
        market_2 = create(:farmers_market, longitude: -81.2843197, latitude: 35.6741832)
        market_3 = create(:farmers_market, longitude: -117.90522, latitude: 48.543279)
        market_4 = create(:farmers_market, longitude: -80.3862664534582, latitude: 33.97372952277976)
        market_5 = create(:farmers_market, longitude: -73.686043, latitude: 40.983895)
        result = FarmersMarket.nearby_markets([34.60, -80.34], 50)
        expect(result.to_a).to eq([market_4])
      end
    end
  end
end
