class CoordinatesFacade
  attr_reader :address
  def initialize(params)
    @address = params
  end
  
  def coordinates
    service.coordinates(@address)[:results].map do |data|
      Coordinate.new(data)
    end
  end

  def service
    CoordinatesService.new
  end

end
