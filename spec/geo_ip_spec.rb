require 'spec_helper'

describe GeoIP do
  describe ".#locate(ip)" do
    let(:stub_location) do
      {
        "ip" => "175.100.127.85",
        "timestamp"=>1297183449660,
        "location" => {
            "coords" => {
              "latitude" => "-27",
              "longitude" => "133"
            },
            "address"=> {
              "city" => "", 
              "country" => "Australia", 
              "country_code" => "AU"
            }, 
            "gmtOffset" => "10.5",
            "dstOffset"=>"9.5"
        }
      }
    end

    it "should return Geo location information" do
      stub_request

      geo_location = GeoIP.locate(stub_location["ip"])

      geo_location.should == stub_location
    end

    def stub_request
      request_uri = "http://geoip.prototypeapp.com/api/locate?ip=175.100.127.85"
      HTTParty.stub(:get).with(request_uri).and_return(stub_location)
    end
  end
end
