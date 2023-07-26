class Market
  attr_reader :name,
              :address,
              :location_description,
              :site_description,
              :payment,
              :FNAP,
              :SNAP
  def initialize(data)
    @name = data[:listing_name]
    @address = data[:location_address]
    @location_description = data[:location_description]
    @site_description = data[:location_site]
    @payment = data[:acceptedpayment]
    @FNAP = data[:FNAP]
    @SNAP = data[:SNAP_option]
  end
end