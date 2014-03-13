class WeatherController < ApplicationController

  def weather
    postcode = params['postcode']

    if postcode.length == 5 # US postcodes
      get_results(postcode)
    end

    if @results.nil?
      @error = 'zipcode not found'
      render :index
    end
  end

  def get_results(postcode)
    @results = WeatherApi.get_for_postcode(postcode)
  end

  def index
  end

end

