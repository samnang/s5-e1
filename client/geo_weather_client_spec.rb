require_relative 'spec_helper'

describe GeoWeather::Client do
  before do
    stub_requests
  end

  shared_examples_for "all requests" do
    it "should return geo weather information" do
      geo_weather.ip.should == "123.108.254.143"
      geo_weather.location.city.should == "Phnom Penh"
      geo_weather.location.country.should == "Cambodia"

      geo_weather.weather.condition.should == "Haze"
      geo_weather.weather.temp_c.should == "24"
      geo_weather.weather.temp_f.should == "75"
      geo_weather.weather.humidity.should == "Humidity: 83%"
    end
  end

  context "no passing ip" do
    let(:geo_weather) { GeoWeather::Client.locate }

    it_should_behave_like "all requests"
  end

  context "passing ip" do
    let(:geo_weather) { GeoWeather::Client.locate("123.108.254.143") }

    it_should_behave_like "all requests"
  end
end
