module GeoWeather
  module Location
    extend self

    GEOIP_URI = "http://geoip.prototypeapp.com/api/locate?ip="

    def locate(ip)
      location_data = HTTParty.get(GEOIP_URI + ip)['location']

      location = {}
      location['ip']           = ip
      location['gmt_offset']   = location_data["gmtOffset"]
      location['latitude']     = location_data['coords']['latitude']
      location['longitude']    = location_data['coords']['longitude']
      location['city']         = location_data['address']['city']
      location['country']      = location_data['address']['country']
      location['country_code'] = location_data['address']['country_code']

      location
    end
  end
end
