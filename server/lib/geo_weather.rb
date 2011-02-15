require 'location'
require 'weather'

module GeoWeather
  extend self

  def weather_in(location)
    Weather.in("#{location['city']}, #{location['country']}")
  end

  def location_for(ip)
    Location.for(ip)
  end
end
