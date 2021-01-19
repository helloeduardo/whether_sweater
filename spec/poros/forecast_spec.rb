RSpec.describe Forecast, type: :model do
  it "exists and has attributes" do
    response = File.read('spec/fixtures/poros/weather_sample_response.json')

    weather = JSON.parse(response, symbolize_names: true)

    data = {
      current_weather: CurrentWeather.new(weather[:current]),

      daily_weather: weather[:daily].first(5).map do |day|
        DailyWeather.new(day)
      end,

      hourly_weather: weather[:hourly].first(8).map do |hour|
          HourlyWeather.new(hour)
      end
    }

    forecast = Forecast.new(data)

    expect(forecast).to be_a Forecast
    expect(forecast.current_weather).to be_a CurrentWeather
    expect(forecast.daily_weather).to be_an Array
    expect(forecast.daily_weather.first).to be_a DailyWeather
    expect(forecast.hourly_weather).to be_an Array
    expect(forecast.hourly_weather.first).to be_a HourlyWeather
  end
end
