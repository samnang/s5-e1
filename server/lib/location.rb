module GeoWeather
  class Location
    GeoIP_URI = "http://geoip.prototypeapp.com/api/locate?ip="

    attr_accessor :ip, :latitude, :longitude, :city, 
                  :country, :country_code, :gmt_offset

    def self.locate(ip)
      location_data = HTTParty.get(GeoIP_URI + ip)['location']

      location              = self.new
      location.ip           = ip
      location.gmt_offset   = location_data["gmtOffset"]
      location.latitude     = location_data['coords']['latitude']
      location.longitude    = location_data['coords']['longitude']
      location.city         = location_data['address']['city']
      location.country      = location_data['address']['country']
      location.country_code = location_data['address']['country_code']

      location
    end
  end
end
