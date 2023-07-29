class Market
  attr_reader :id,
              :name,
              :address,
              :location_description,
              :site_description,
              :payment,
              :FNAP,
              :SNAP_option

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @address = data[:attributes][:address]
    @location_description = data[:attributes][:description]
    @site_description = data[:attributes][:site]
    @payment = data[:attributes][:accepted_payment]
    @FNAP = data[:attributes][:fnap]
    @SNAP_option = data[:attributes][:snap_option]
  end
end
