require 'rails_helper'

RSpec.describe Market, type: :poro do
  it 'can be initialized with data' do
    market_data = {
      id: '123',
      attributes: {
        name: 'Market Name',
        address: 'Market Address',
        site: 'Market Site',
        description: 'Market Description',
        fnap: 'Market FNAP',
        snap_option: 'Market SNAP Option'
      }
    }

    market = Market.new(market_data)

    expect(market.id).to eq('123')
    expect(market.name).to eq('Market Name')
    expect(market.address).to eq('Market Address')
    expect(market.site).to eq('Market Site')
    expect(market.description).to eq('Market Description')
    expect(market.fnap).to eq('Market FNAP')
    expect(market.snap_option).to eq('Market SNAP Option')
  end
end