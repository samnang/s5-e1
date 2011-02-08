require 'httparty'

class GeoIP
  GeoIP_URI = "http://geoip.prototypeapp.com/api/locate?ip="

  def self.locate(ip)
    HTTParty.get(GeoIP_URI + ip)
  end
end
