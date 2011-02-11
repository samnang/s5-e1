require 'spec_helper'

describe GeoWeather::Weather do
  describe ".weather_at(location)" do
    it "should return weather information" do
      stub_requests

      weather = GeoWeather::Weather.weather_at("Phnom Penh, Cambodia")
 
      weather.temp_f.should == "75"
      weather.temp_c.should == "24"
      weather.condition.should == "Haze"
      weather.humidity.should == "Humidity: 83%"
      weather.wind_condition.should == "Wind: SE at 6 mph"
    end
  end
end
