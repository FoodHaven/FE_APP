require 'rails_helper'

RSpec.describe FarmersMarket, type: :model do
  describe 'validations' 

  describe 'class methods' do 
    describe 'benefits' do 
      before(:each) do 
        create(:market, fnap: nil)
        create(:market, snap_option: nil)
        create(:market, fnap: nil, snap_option: nil)
        create(:market, fnap: nil, snap_option: nil)
        create(:market, snap_option: 'accepts')
        create(:market, snap_option: 'accepts', fnap: 'accepts')
      end

      it '::accepts_benefits' do 
        result = Market.accepts_benefits
        expect(result.count).to eq(4) 
      end

      it '::snap_available' do 
        result = Market.snap_available
        expect(result.count).to eq(3)
      end

      it '::fnap_available' do 
        result = Market.fnap_available
        expect(result.count).to eq(3)
      end
    end

    describe 'proximity' do 
      it '::nearby_markets' do 
        market_1 = create(:market, longitude: -81.1478018, latitude: 36.1582212)
        market_2 = create(:market, longitude: -81.2843197, latitude: 35.6741832)
        market_3 = create(:market, longitude: -117.90522, latitude: 48.543279)
        market_4 = create(:market, longitude: -80.3862664534582, latitude: 33.97372952277976)
        market_5 = create(:market, longitude: -73.686043, latitude: 40.983895)
        result = Market.nearby_markets([34.60, -80.34], 50)
        expect(result.to_a).to eq([market_4])
      end
    end
  end
end
