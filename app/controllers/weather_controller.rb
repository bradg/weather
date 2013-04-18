class WeatherController < ApplicationController
  def weather
    if params['postcode'] =~ /^\d{5}$/ # postcode is 5 digits?
      begin
        @results = WeatherApi.get_for_postcode(params['postcode'])
      rescue
        flash[:notice] = 'There was a problem with the API'
        render :index
        return
      end
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
