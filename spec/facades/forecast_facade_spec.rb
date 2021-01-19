RSpec.describe ForecastFacade, :vcr do
  it 'returns a forecast' do
    location = 'denver,co'

    forecast = ForecastFacade.forecast(location)

    expect(forecast).to be_a Forecast
  end

  it 'returns a coordinates hash' do
    location = 'denver,co'

    coordinates = ForecastFacade.coordinates(location)

    expect(coordinates).to be_a Hash

    expect(coordinates).to have_key :lat
    expect(coordinates[:lat]).to be_a Numeric

    expect(coordinates).to have_key :lng
    expect(coordinates[:lng]).to be_a Numeric
  end
end
