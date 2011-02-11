module GeoWeather
  class Weather
    GOOGLE_WEATHER = "http://www.google.com/ig/api?weather="

    attr_accessor :temp_f, :temp_c, :condition, :humidity, :wind_condition, :current_date_time

    def self.weather_at(location)
      uri = URI.escape(GOOGLE_WEATHER + location)
      weather_data = HTTParty.get(uri)['xml_api_reply']['weather']

      current_weather = weather_data['current_conditions']

      weather = self.new
      weather.current_date_time = weather_data['forecast_information']['current_date_time']['data']
      %w{condition temp_f temp_c humidity wind_condition}.each do |attr|
        weather.send("#{attr}=", current_weather[attr]['data'])
      end

      weather
    end
  end
end
