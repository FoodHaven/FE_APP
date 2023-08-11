class Market
  attr_reader :name, :address, :site, :description, :fnap, :snap_option,
              :accepted_payment, :longitude, :latitude, :id, :accepted_payment

  def initialize(data)
    @name             = data[:name] || data[:attributes][:name]
    @address          = data[:address] || data[:attributes][:address]
    @site             = data[:site] || data[:attributes][:site]
    @description      = data[:description] || data[:attributes][:description]
    @fnap             = data[:fnap] || data[:attributes][:fnap]
    @snap_option      = data[:snap_option] || data[:attributes][:snap_option]
    @accepted_payment = data[:accepted_payment] || data[:attributes][:accepted_payment]
    @longitude        = data[:longitude] || data[:attributes][:longitude]
    @latitude         = data[:latitude] || data[:attributes][:latitude]
    @id               = data[:id].to_i
  end
end