require 'spec_helper'

describe GeoWeather::GeoLocation do
  describe ".locate(ip)" do
    it "should return Geo location information" do
      stub_requests

      geo_location = GeoWeather::GeoLocation.locate('127.0.0.1')
 
      geo_location.latitude.should == "11.55"
      geo_location.city.should == "Phnom Penh"
      geo_location.country.should == "Cambodia"
      geo_location.gmt_offset.should == "7"
    end
  end
end
