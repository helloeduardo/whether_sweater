RSpec.describe 'Munchies Endpoint', type: :request do
  it 'can return food and forecast information for a destination', :vcr do
    get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese'

    expect(response).to be_successful

    munchie = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(munchie).to have_key(:id)
    expect(munchie[:id]).to be_nil

    expect(munchie).to have_key(:type)
    expect(munchie[:type]).to eq('munchie')

    expect(munchie).to have_key(:attributes)
    expect(munchie[:attributes]).to be_a(Hash)


    attributes = munchie[:attributes]

    expect(attributes).to have_key(:destination_city)
    expect(attributes[:destination_city]).to be_a(String)

    expect(attributes).to have_key(:travel_time)
    expect(attributes[:travel_time]).to be_a(String)

    expect(attributes).to have_key(:forecast)
    expect(attributes[:forecast]).to be_a(Hash)

    expect(attributes).to have_key(:restaurant)
    expect(attributes[:restaurant]).to be_a(Hash)

    forecast = attributes[:forecast]

    expect(forecast).to have_key(:summary)
    expect(forecast[:summary]).to be_a(String)

    expect(forecast).to have_key(:temperature)
    expect(forecast[:temperature]).to be_a(Numeric)

    restaurant = attributes[:restaurant]

    expect(restaurant).to have_key(:name)
    expect(restaurant[:name]).to be_a(String)

    expect(restaurant).to have_key(:address)
    expect(restaurant[:address]).to be_a(String)
  end
end
