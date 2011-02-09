module GeoWeather
  class GeoLocation
    GeoIP_URI = "http://geoip.prototypeapp.com/api/locate?ip="

    attr_accessor :ip, :latitude, :longitude, :city, 
                  :country, :country_code, :gmt_offset

    def self.locate(ip)
      location_data = HTTParty.get(GeoIP_URI + ip)['location']

      geo_location = self.new
      geo_location.ip = ip
      geo_location.gmt_offset = location_data["gmtOffset"]
      geo_location.latitude = location_data['coords']['latitude']
      geo_location.longitude = location_data['coords']['longitude']
      geo_location.city = location_data['address']['city']
      geo_location.country = location_data['address']['country']
      geo_location.country_code = location_data['address']['country_code']

      geo_location
    end
  end
end
