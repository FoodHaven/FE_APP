class Market
  attr_reader :name,
              :address,
              :description,
              :site,
              :accepted_payment,
              :fnap,
              :snap_option,
              :id
  def initialize(attributes)
    @name = attributes[:attributes][:name]
    @address = attributes[:attributes][:address]
    @location_description = attributes[:attributes][:description]
    @site_description = attributes[:attributes][:site]
    @payment = attributes[:attributes][:accepted_payment]
    @FNAP = attributes[:attributes][:fnap]
    @SNAP = attributes[:attributes][:snap_option]
    @id = attributes[:id].to_i
  end
end