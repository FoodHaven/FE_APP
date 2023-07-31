class SingleMarket
  attr_reader :name,
              :address,
              :description,
              :site,
              :payment,
              :fnap,
              :snap,
              :id, 
              :longitude, 
              :latitude
  def initialize(attributes)
    @name = attributes[:data][:attributes][:name]
    @address = attributes[:data][:attributes][:address]
    @location_description = attributes[:data][:attributes][:description]
    @site = attributes[:data][:attributes][:site]
    @payment = attributes[:data][:attributes][:accepted_payment]
    @fnap = attributes[:data][:attributes][:fnap]
    @snap = attributes[:data][:attributes][:snap_option]
    @longitude = attributes[:data][:longitude]
    @latitude = attributes[:data][:latitude]
    @id = attributes[:data][:id].to_i
  end
end