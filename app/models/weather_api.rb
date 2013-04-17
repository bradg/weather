class WeatherApi
  cattr_accessor :supplier
  
  def self.get_for_postcode(postcode)
    raise('Weather supplier not set') unless supplier
    supplier.get_for_postcode(postcode)
  end
end
