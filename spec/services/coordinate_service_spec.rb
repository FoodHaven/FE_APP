require 'rails_helper'

RSpec.describe CoordinatesService do
  let(:coordinates_service) { CoordinatesService.new }

  describe '#coordinates' do
    it 'fetches coordinates for address' do

      address = "6715 W Colfax Ave, Lakewood, CO 80214"

      stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=#{address}")
        .to_return(status: 200, body: '{"geometry"{"location"{"lat": 39.7418, "lng": -105.0708}}}', headers: { 'Content-Type' => 'application/json' })
      response = coordinates_service.coordinates(address)

      expect(response).to be_an(Hash)
      expect(response[:results][0][:geometry]).to have_key(:location)
      expect(response[:results][0][:geometry][:location]).to have_key(:lat)
      expect(response[:results][0][:geometry][:location]).to have_key(:lng)
    end
  end
end

