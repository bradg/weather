class WeatherApi
  cattr_accessor :supplier
  
  def self.get_for_postcode(postcode)
    supplier.get_for_postcode(postcode)
  end
end
