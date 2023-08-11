class FarmersMarket < ApplicationRecord
  acts_as_mappable  lat_column_name: :latitude,
                    lng_column_name: :longitude

  def self.accepts_benefits
    where('fnap IS NOT NULL OR snap_option IS NOT NULL')
  end

  def self.snap_available
    where('snap_option IS NOT NULL')
  end

  def self.fnap_available
    where('fnap IS NOT NULL')
  end

  def self.nearby_markets(coordinates, radius)
    within(radius, origin: coordinates)
  end
end
