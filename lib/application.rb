require 'sinatra/base'
require 'json'
require 'httparty'

require 'configuration.rb'
require 'geo_location'
require 'weather'

class Application < Sinatra::Base
  get '/' do
    content_type :json

    reponse_geo_weather
  end

  private
  def reponse_geo_weather
    geo_weather = Hash.new {|h, k| h[k] = {}}

    geo_weather['ip'] = geo_location.ip
    geo_weather['current_date_time'] = weather.current_date_time
    geo_weather['location']['latitude'] = geo_location.latitude
    geo_weather['location']['longitude'] = geo_location.longitude
    geo_weather['location']['city'] = geo_location.city
    geo_weather['location']['country'] = geo_location.country
    geo_weather['location']['country_code'] = geo_location.country_code
    geo_weather['location']['gmt_offset'] = geo_location.gmt_offset
    geo_weather['weather']['condition'] = weather.condition
    geo_weather['weather']['temp_f'] = weather.temp_f
    geo_weather['weather']['temp_c'] = weather.temp_c
    geo_weather['weather']['humidity'] = weather.humidity
    geo_weather['weather']['wind_condition'] = weather.wind_condition

    geo_weather.to_json
  rescue StandardError => e
    puts e
  end

  def geo_location
    @geo_location ||= GeoWeather::GeoLocation.locate(request_ip)
  end

  def weather
    location = "#{geo_location.city}, #{geo_location.country}"

    @weather ||= GeoWeather::Weather.weather_at(location)
  end

  def request_ip
    params['ip'] || request.ip
  end
end
