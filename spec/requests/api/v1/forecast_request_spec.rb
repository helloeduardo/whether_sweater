RSpec.describe 'Forecast Endpoint', type: :request do
  it "can return weather for a city", :vcr do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(forecast).to have_key(:id)
    expect(forecast[:id]).to be_nil

    expect(forecast).to have_key(:type)
    expect(forecast[:type]).to eq('forecast')

    expect(forecast).to have_key(:attributes)
    expect(forecast[:attributes]).to be_a(Hash)


    attributes = forecast[:attributes]

    expect(attributes).to have_key(:current_weather)
    expect(attributes[:current_weather]).to be_a(Hash)

    expect(attributes).to have_key(:daily_weather)
    expect(attributes[:daily_weather]).to be_an(Array)

    expect(attributes).to have_key(:hourly_weather)
    expect(attributes[:hourly_weather]).to be_an(Array)


    current_weather = attributes[:current_weather]

    expect(current_weather).to have_key :datetime
    expect(current_weather[:datetime]).to be_a String

    expect(current_weather).to have_key :sunrise
    expect(current_weather[:sunrise]).to be_a String

    expect(current_weather).to have_key :sunset
    expect(current_weather[:sunset]).to be_a String

    expect(current_weather).to have_key :temperature
    expect(current_weather[:temperature]).to be_a Numeric

    expect(current_weather).to have_key :feels_like
    expect(current_weather[:feels_like]).to be_a Numeric

    expect(current_weather).to have_key :humidity
    expect(current_weather[:humidity]).to be_a Numeric

    expect(current_weather).to have_key :uvi
    expect(current_weather[:uvi]).to be_a Numeric

    expect(current_weather).to have_key :visibility
    expect(current_weather[:visibility]).to be_a Numeric

    expect(current_weather).to have_key :conditions
    expect(current_weather[:conditions]).to be_a String

    expect(current_weather).to have_key :icon
    expect(current_weather[:icon]).to be_a String


    daily_weather = attributes[:daily_weather]

    expect(daily_weather.count).to eq(5)

    day = daily_weather.first

    expect(day).to be_a(Hash)

    expect(day).to have_key :date
    expect(day[:date]).to be_a String

    expect(day).to have_key :sunrise
    expect(day[:sunrise]).to be_a String

    expect(day).to have_key :sunset
    expect(day[:sunset]).to be_a String

    expect(day).to have_key :max_temp
    expect(day[:max_temp]).to be_a Float

    expect(day).to have_key :min_temp
    expect(day[:min_temp]).to be_a Float

    expect(day).to have_key :conditions
    expect(day[:conditions]).to be_a String

    expect(day).to have_key :icon
    expect(day[:icon]).to be_a String

    hourly_weather = attributes[:hourly_weather]

    expect(hourly_weather.count).to eq(8)

    hour = hourly_weather.first

    expect(hour).to be_a(Hash)

    expect(hour).to have_key :time
    expect(hour[:time]).to be_a String

    expect(hour).to have_key :temperature
    expect(hour[:temperature]).to be_a Float

    expect(hour).to have_key :wind_speed
    expect(hour[:wind_speed]).to be_a String

    expect(hour).to have_key :wind_direction
    expect(hour[:wind_direction]).to be_a String

    expect(hour).to have_key :conditions
    expect(hour[:conditions]).to be_a String

    expect(hour).to have_key :icon
    expect(hour[:icon]).to be_a String
  end
end
