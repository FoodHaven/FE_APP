class TransportationSearch
  def all_transportations
    service = TransportationSearch.new
    request = service.all_transportations
    @transportations = request[:data].map do |t|
      Transportation.new(t)
    end
  end
end