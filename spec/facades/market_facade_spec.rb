require 'rails_helper'

RSpec.describe RouteFacade, :vcr do
  let(:params) do
    {
      latitude: "latitude",
      longitude: "longitude",
      radius: "radius",
      id: "1",
      market_id: "1"
    }
  end

  subject { MarketFacade.new(params) }

  describe '#all_markets' do
    it 'returns all markets' do
      markets = subject.all_markets

      expect(markets).to all(be_a(Market))
    end
  end

  describe '#market' do
    it 'returns a single market' do
      market = subject.market

      expect(market).to be_a(Market)
    end
  end
end