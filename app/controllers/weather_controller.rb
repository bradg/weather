class WeatherController < ApplicationController
  def weather
    if params['postcode'] =~ /^\d{5}$/
      @results = WeatherApi.get_for_postcode(params['postcode'])
      if @results.nil?
        flash[:notice] = 'zipcode not found'
        render :index
      end
    else
      flash[:notice] = 'invalid zip code format'
      render :index
    end
  end
end
