class Coordinate
  attr_reader :latitude, :longitude
  def initialize(attributes)
    @latitude = attributes[:geometry][:location][:lat]
    @longitude = attributes[:geometry][:location][:lng]
  end
end