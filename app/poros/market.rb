class Market
  attr_reader :name,
              :address,
              :description,
              :site,
              :accepted_payment,
              :fnap,
              :snap,
              :id,
              :latitude,
              :longitude

  def initialize(attributes)
    @name = attributes[:attributes][:name]
    @address = attributes[:attributes][:address]
    @description = attributes[:attributes][:description]
    @site = attributes[:attributes][:site]
    @payment = attributes[:attributes][:accepted_payment]
    @fnap = attributes[:attributes][:fnap] 
    @snap = attributes[:attributes][:snap_option]
    @id = attributes[:id].to_i
    @latitude = attributes[:attributes][:latitude]
    @longitude = attributes[:attributes][:longitude]
  end
end