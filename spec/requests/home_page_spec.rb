require 'spec_helper'

class TestWeatherSupplier; end
WeatherApi.supplier = TestWeatherSupplier

describe 'home page' do
  it 'displays a page that has a form input and a button' do
    get '/'
    assert_select 'form' do
      assert_select 'input'
      assert_select 'input[type=submit]'
    end
  end

  describe 'after submitting a valid postcode' do
    it 'displays the city name, state name and current temperature in fahrenheit' do
      sample_response = OpenStruct.new({:city => 'San Fran', :state => 'California', :temperature => '50'})
      TestWeatherSupplier.expects(:get_for_postcode).returns(sample_response)
      get '/weather?postcode=90210'
      response.body.should =~ /San Fran/
      response.body.should =~ /California/
      response.body.should =~ /50/
    end
  end

  describe 'after submitting an invalid postcode' do
    it 'displays the error "invalid zip code format"' do
      get '/weather?postcode=1234'
      response.body.should =~ /invalid zip code format/
    end
  end

  describe 'after submitting a zip code that does not exist' do
    it 'displays the error "zipcode not found"' do
      TestWeatherSupplier.expects(:get_for_postcode).raises("PostcodeNotFound")
      get '/weather?postcode=11111'
      response.body.should =~ /zipcode not found/
    end
  end
end
