require 'rails_helper'

RSpec.describe Coordinate, type: :poro do
  it 'can be initialized with data' do
    data = {
      geometry: {
        location: {
        lat: 39.7418,
        lng: -105.0708
      }
      }
    }

    coordinates = Coordinate.new(data)
    expect(coordinates.latitude).to be_a(Float)
    expect(coordinates.latitude).to eq(39.7418)
    expect(coordinates.longitude).to be_a(Float)
    expect(coordinates.longitude).to eq(-105.0708)
  end
end
