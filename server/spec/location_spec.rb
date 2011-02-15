require 'spec_helper'

describe GeoWeather::Location do
  describe ".for(ip)" do
    it "should return Geo location information" do
      stub_requests

      location = GeoWeather::Location.for('127.0.0.1')
 
      location['latitude'].should == "11.55"
      location['city'].should == "Phnom Penh"
      location['country'].should == "Cambodia"
      location['gmt_offset'].should == "7"
    end
  end
end
