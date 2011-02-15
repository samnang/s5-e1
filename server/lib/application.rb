require 'sinatra/base'
require 'json'
require 'httparty'

require 'configuration'
require 'geo_weather'

class Application < Sinatra::Base
  get '/' do
    content_type :json

    response_geo_weather
  end

  error 500 do
    content_type :json

    {:status => "There is something wrong in preventing us from getting information of your location. You could try to pass another ip instead."}.to_json
  end

  private
  def response_geo_weather
    geo_weather = {}

    location = GeoWeather.location_for(request_ip)
    geo_weather['location'] = location
    geo_weather['weather']  = GeoWeather.weather_in(location)

    geo_weather.to_json
  end

  def request_ip
    params['ip'] || request.ip
  end
end
