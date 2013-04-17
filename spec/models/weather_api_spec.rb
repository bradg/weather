require 'spec_helper'

class TestWeatherSupplier; end
WeatherApi.supplier = TestWeatherSupplier

describe WeatherApi do
  it "should be using the test weather supplier api" do
    WeatherApi.supplier.should == TestWeatherSupplier
  end

  it "should query the API for the weather" do
    TestWeatherSupplier.should_receive(:get_for_postcode).once
    WeatherApi.get_for_postcode('90210')
  end

  it 'should pass the postcode to the API' do
    TestWeatherSupplier.should_receive(:get_for_postcode).with('90210').once
    WeatherApi.get_for_postcode('90210')
  end

end
