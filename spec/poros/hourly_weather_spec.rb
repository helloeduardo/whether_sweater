RSpec.describe HourlyWeather do
  it "exists and has attributes" do
    response = File.read('spec/fixtures/poros/weather_sample_response.json')

    weather = JSON.parse(response, symbolize_names: true)

    current_weather = HourlyWeather.new(weather[:hourly].first)

    expect(current_weather).to be_a HourlyWeather
    expect(current_weather.time).to be_a String
    expect(current_weather.temperature).to be_a Numeric
    expect(current_weather.wind_speed).to be_a String
    expect(current_weather.wind_direction).to be_a String
    expect(current_weather.conditions).to be_a String
    expect(current_weather.icon).to be_a String
  end
end
