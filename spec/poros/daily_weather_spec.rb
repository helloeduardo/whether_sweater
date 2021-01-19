RSpec.describe DailyWeather do
  it "exists and has attributes" do
    response = File.read('spec/fixtures/poros/weather_sample_response.json')

    weather = JSON.parse(response, symbolize_names: true)

    current_weather = DailyWeather.new(weather[:daily].first)

    expect(current_weather).to be_a DailyWeather
    expect(current_weather.date).to be_a Time
    expect(current_weather.sunrise).to be_an Time
    expect(current_weather.sunset).to be_a Time
    expect(current_weather.max_temp).to be_a Numeric
    expect(current_weather.min_temp).to be_a Numeric
    expect(current_weather.conditions).to be_a String
    expect(current_weather.icon).to be_a String
  end
end
