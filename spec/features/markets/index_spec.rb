require 'rails_helper'

RSpec.describe MarketsController, type: :controller do
  describe 'GET index' do
    context 'with latitude and longitude parameters' do
      it 'returns markets and nearby markets' do
        allow_any_instance_of(MarketService).to receive(:all_markets)
        .and_return([
          { id: 1, name: 'Market 1' },
          { id: 2, name: 'Market 2' }
        ])

        allow(MarketService).to receive(:nearby_markets)
          .and_return([{ id: 3, name: 'Nearby Market 1' }, { id: 4, name: 'Nearby Market 2' }])

        get :index, params: { latitude: 10.0, longitude: 20.0, radius: 5.0 }

        expect(response).to have_http_status(:success)
        expect(assigns(:markets).size).to eq(2)
        expect(assigns(:nearby_markets).size).to eq(2)
      end
    end
  end
end