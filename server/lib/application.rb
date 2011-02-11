require 'sinatra/base'
require 'json'
require 'httparty'

require 'configuration.rb'
require 'location'
require 'weather'

class Application < Sinatra::Base
  include GeoWeather::Weather
  include GeoWeather::Location

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

    geo_weather['location'] = location
    geo_weather['weather']  = weather

    geo_weather.to_json
  end

  def location
    @location ||= locate(request_ip)
  end

  def weather
    weather_at("#{location['city']}, #{location['country']}")
  end

  def request_ip
    params['ip'] || request.ip
  end
end
