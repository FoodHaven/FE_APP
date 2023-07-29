class Market
  attr_reader :id,
              :name,
              :address,
              :site,
              :description,
              :fnap,
              :snap_option,
              :accepted_payment,
              :longitude,
              :latitude

  def initialize(data)
    return unless data && data[:attributes]

    @id = data[:id]
    @name = data[:attributes][:name]
    @address = data[:attributes][:address]
    @site = data[:attributes][:site]
    @description = data[:attributes][:description]
    @fnap = data[:attributes][:fnap]
    @snap_option = data[:attributes][:snap_option]
    @accepted_payment = data[:attributes][:accepted_payment]
    @longitude = data[:attributes][:longitude]
    @latitude = data[:attributes][:latitude]
  end
end
