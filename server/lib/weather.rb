module GeoWeather
  module Weather
    extend self

    GOOGLE_WEATHER = "http://www.google.com/ig/api?weather="

    def weather_at(location)
      uri = URI.escape(GOOGLE_WEATHER + location)
      weather_data = HTTParty.get(uri)['xml_api_reply']['weather']

      current_weather = weather_data['current_conditions']

      weather = {}
      weather['current_date_time'] = weather_data['forecast_information']['current_date_time']['data']
      %w{condition temp_f temp_c humidity wind_condition}.each do |attr|
        weather[attr] = current_weather[attr]['data']
      end

      weather
    end
  end
end
