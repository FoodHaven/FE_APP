require 'rails_helper'

RSpec.describe RouteFacade, :vcr do
  let(:params) do
    {
      latitude: "latitude",
      longitude: "longitude",
      radius: "radius",
      id: "1"
    }
  end

  subject { MarketFacade.new(params) }

  describe '#all_markets' do
    xit 'returns all markets' do
      market_facade = MarketFacade.new(params)
      expect(MarketService).to receive(:new).and_return(double(all_markets: {}))
    end
  end

  describe '#market' do
    xit 'returns a single market' do
      market_facade = MarketFacade.new(params)
      expect(MarketService).to receive(:new).and_return(double(one_market: {}))

    end
  end
end