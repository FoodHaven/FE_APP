class Market
  attr_reader :name,
              :address,
              :description,
              :site,
              :accepted_payment,
              :fnap,
              :snap_option
  def initialize(attributes)
    @name = attributes[:name]
    @address = attributes[:address]
    @location_description = attributes[:description]
    @site_description = attributes[:site]
    @payment = attributes[:accepted_payment]
    @FNAP = attributes[:fnap]
    @SNAP = attributes[:snap_option]
  end
end