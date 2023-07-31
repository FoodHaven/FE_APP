require 'rails_helper'

RSpec.describe SingleMarket, type: :poro do
  let(:market_data) do
    {
      data: {
        id: '123',
        attributes: {
          name: 'Market Name',
          address: 'Market Address',
          site: 'Market Site',
          location_description: 'Market Description',
          accepted_payment: 'Market Payment',
          fnap: 'Market FNAP',
          snap_option: 'Market SNAP Option'
        },
        longitude: '12.3456',
        latitude: '78.9012'
      }
    }
  end

  it 'can be initialized with data' do
    market = SingleMarket.new(market_data)

    expect(market.id).to eq(123)
    expect(market.name).to eq('Market Name')
    expect(market.address).to eq('Market Address')
    expect(market.site).to eq('Market Site')
    expect(market.location_description).to eq('Market Description')
    expect(market.payment).to eq('Market Payment')
    expect(market.fnap).to eq('Market FNAP')
    expect(market.snap).to eq('Market SNAP Option')
    expect(market.longitude).to eq('12.3456')
    expect(market.latitude).to eq('78.9012')
  end
end