class WeatherController < ApplicationController
  def weather
    @results = WeatherApi.get_for_postcode(params['postcode'])
  end
end
