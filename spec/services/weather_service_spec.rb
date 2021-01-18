RSpec.describe WeatherService, :vcr do
  it 'can get weather forecast for coordinates' do
    coordinates = {
      lat: 39.738453,
      lng: -104.984853
    }

    response = WeatherService.weather(coordinates)

    expect(response).to be_a Hash

    expect(response).to have_key(:lat)
    expect(response[:lat]).to be_a Numeric
    expect(response[:lat]).to eq(coordinates[:lat].round(4))

    expect(response).to have_key(:lon)
    expect(response[:lon]).to be_a Numeric
    expect(response[:lon]).to eq(coordinates[:lng].round(4))

    expect(response).to have_key(:current)
    expect(response[:current]).to be_a Hash

    expect(response[:current]).to have_key(:dt)
    expect(response[:current][:dt]).to be_an Integer

    expect(response[:current]).to have_key(:sunrise)
    expect(response[:current][:sunrise]).to be_an Integer

    expect(response[:current]).to have_key(:sunset)
    expect(response[:current][:sunset]).to be_an Integer

    expect(response[:current]).to have_key(:temp)
    expect(response[:current][:temp]).to be_a Numeric

    expect(response[:current]).to have_key(:feels_like)
    expect(response[:current][:feels_like]).to be_a Numeric

    expect(response[:current]).to have_key(:humidity)
    expect(response[:current][:humidity]).to be_a Numeric

    expect(response[:current]).to have_key(:uvi)
    expect(response[:current][:uvi]).to be_a Numeric

    expect(response[:current]).to have_key(:visibility)
    expect(response[:current][:visibility]).to be_a Numeric

    expect(response[:current]).to have_key(:weather)
    expect(response[:current][:weather]).to be_an Array
    expect(response[:current][:weather].first).to be_a Hash

    expect(response[:current][:weather].first).to have_key(:description)
    expect(response[:current][:weather].first[:description]).to be_a String

    expect(response[:current][:weather].first).to have_key(:icon)
    expect(response[:current][:weather].first[:icon]).to be_a String

    expect(response).to have_key(:hourly)
    expect(response[:hourly]).to be_an Array
    expect(response[:hourly].size).to eq(48)

    hour = response[:hourly].first

    expect(hour).to be_a Hash

    expect(hour).to have_key(:dt)
    expect(hour[:dt]).to be_an Integer

    expect(hour).to have_key(:temp)
    expect(hour[:temp]).to be_a Numeric

    expect(hour).to have_key(:wind_speed)
    expect(hour[:wind_speed]).to be_a Numeric

    expect(hour).to have_key(:wind_deg)
    expect(hour[:wind_deg]).to be_a Numeric

    expect(hour).to have_key(:weather)
    expect(hour[:weather]).to be_an Array
    expect(hour[:weather].first).to be_a Hash

    expect(hour[:weather].first).to have_key(:description)
    expect(hour[:weather].first[:description]).to be_a String

    expect(hour[:weather].first).to have_key(:icon)
    expect(hour[:weather].first[:icon]).to be_a String

    expect(response).to have_key(:daily)
    expect(response[:daily]).to be_an Array
    expect(response[:daily].size).to eq(8)

    day = response[:daily].first

    expect(day).to have_key(:dt)
    expect(day[:dt]).to be_an Integer

    expect(day).to have_key(:sunrise)
    expect(day[:sunrise]).to be_an Integer

    expect(day).to have_key(:sunset)
    expect(day[:sunset]).to be_an Integer

    expect(day).to have_key(:temp)
    expect(day[:temp]).to be_a Hash

    expect(day[:temp]).to have_key(:min)
    expect(day[:temp][:min]).to be_a Numeric

    expect(day[:temp]).to have_key(:max)
    expect(day[:temp][:max]).to be_a Numeric

    expect(day).to have_key(:weather)
    expect(day[:weather]).to be_an Array
    expect(day[:weather].first).to be_a Hash

    expect(day[:weather].first).to have_key(:description)
    expect(day[:weather].first[:description]).to be_a String

    expect(day[:weather].first).to have_key(:icon)
    expect(day[:weather].first[:icon]).to be_a String
  end
end
