RSpec.describe CurrentWeather do
  it "exists and has attributes" do
    response = File.read('spec/fixtures/poros/weather_sample_response.json')

    weather = JSON.parse(response, symbolize_names: true)

    current_weather = CurrentWeather.new(weather[:current])

    expect(current_weather).to be_a CurrentWeather
    expect(current_weather.datetime).to be_a Time
    expect(current_weather.sunrise).to be_an Time
    expect(current_weather.sunset).to be_a Time
    expect(current_weather.temperature).to be_a Numeric
    expect(current_weather.feels_like).to be_a Numeric
    expect(current_weather.humidity).to be_a Numeric
    expect(current_weather.uvi).to be_a Numeric
    expect(current_weather.visibility).to be_a Numeric
    expect(current_weather.conditions).to be_a String
    expect(current_weather.icon).to be_a String
  end
end
