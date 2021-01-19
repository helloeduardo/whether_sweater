class ForecastFacade
  def self.forecast(location)
    weather = WeatherService.weather(coordinates(location))

    forecast = {
      current_weather: CurrentWeather.new(weather[:current]),

      daily_weather: weather[:daily].first(5).map do |day|
        DailyWeather.new(day)
      end,

      hourly_weather: weather[:hourly].first(8).map do |hour|
          HourlyWeather.new(hour)
      end
    }

    Forecast.new(forecast)
  end

  def self.coordinates(location)
    response = GeocodeService.coordinates(location)

    response[:results].first[:locations].first[:latLng]
  end
end
