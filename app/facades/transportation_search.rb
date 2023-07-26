class TransportationSearch
  def all_tansportations
    service = TransportationService.new
    request = service.all_transportations
    @transportations = request[:data].map do |t|
      Transportation.new(t)
    end
  end
end