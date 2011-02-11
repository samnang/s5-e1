require 'httparty'

module GeoWeather
  class Client
    GEO_WEATHER_URI = "http://localhost:9292"

    def self.locate(ip="")
      response = HTTParty.get request_uri(ip)

      parse_response(response)
    end

    private

    def self.request_uri(ip)
      uri = GEO_WEATHER_URI
      uri += "/?ip=#{ip}" unless ip.empty?

      uri
    end

    def self.parse_response(response)
      geo_weather = OpenStruct.new(response)
      geo_weather.location = OpenStruct.new(response["location"])
      geo_weather.weather = OpenStruct.new(response["weather"])

      geo_weather
    end
  end
end
