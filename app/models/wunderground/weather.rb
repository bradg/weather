class Wunderground::Weather

  def self.get_for_postcode(postcode)
    {:response => {
      :current_observations => {:temperature => 10},
      :city => 'Hometown',
      :state_name => 'Texas'}
    }
    OpenStruct.new({:city => 'San Fran', :state => 'California', :temperature => '50'})
  end
end
