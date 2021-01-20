RSpec.describe 'Road Trip Endpoint', type: :request do
  it 'can return road trip information', :vcr do
    user_body = {
      "email": "whatever@example.com",
      "password": "password"
    }

    user = User.create!(user_body)

    body = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": user.api_key
    }

    headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }

    post '/api/v1/road_trip', headers: headers, params: body.to_json
    expect(response).to be_successful

    trip = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(trip).to have_key(:id)
    expect(trip[:id]).to be_nil

    expect(trip).to have_key(:type)
    expect(trip[:type]).to eq('road_trip')

    expect(trip).to have_key(:attributes)
    expect(trip[:attributes]).to be_a(Hash)

    attributes = trip[:attributes]

    expect(attributes).to have_key(:start_city)
    expect(attributes[:start_city]).to be_a(String)

    expect(attributes).to have_key(:end_city)
    expect(attributes[:end_city]).to be_a(String)

    expect(attributes).to have_key(:travel_time)
    expect(attributes[:travel_time]).to be_a(String)

    expect(attributes).to have_key(:weather_at_eta)
    expect(attributes[:weather_at_eta]).to be_a(Hash)

    weather = attributes[:weather_at_eta]

    expect(weather).to have_key(:temperature)
    expect(weather[:temperature]).to be_a(Numeric)

    expect(weather).to have_key(:conditions)
    expect(weather[:conditions]).to be_a(String)
  end

  it 'can return road trip information for long trips', :vcr do
    user_body = {
      "email": "whatever@example.com",
      "password": "password"
    }

    user = User.create!(user_body)

    body = {
      "origin": "New York, NY",
      "destination": "Los Angeles, CA",
      "api_key": user.api_key
    }

    headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }

    post '/api/v1/road_trip', headers: headers, params: body.to_json
    expect(response).to be_successful

    trip = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(trip).to have_key(:id)
    expect(trip[:id]).to be_nil

    expect(trip).to have_key(:type)
    expect(trip[:type]).to eq('road_trip')

    expect(trip).to have_key(:attributes)
    expect(trip[:attributes]).to be_a(Hash)

    attributes = trip[:attributes]

    expect(attributes).to have_key(:start_city)
    expect(attributes[:start_city]).to be_a(String)

    expect(attributes).to have_key(:end_city)
    expect(attributes[:end_city]).to be_a(String)

    expect(attributes).to have_key(:travel_time)
    expect(attributes[:travel_time]).to be_a(String)

    expect(attributes).to have_key(:weather_at_eta)
    expect(attributes[:weather_at_eta]).to be_a(Hash)

    weather = attributes[:weather_at_eta]

    expect(weather).to have_key(:temperature)
    expect(weather[:temperature]).to be_a(Numeric)

    expect(weather).to have_key(:conditions)
    expect(weather[:conditions]).to be_a(String)
  end

  it 'can return partial road trip information for impossible trips', :vcr do
    user_body = {
      "email": "whatever@example.com",
      "password": "password"
    }

    user = User.create!(user_body)

    body = {
      "origin": "New York, NY",
      "destination": "London, UK",
      "api_key": user.api_key
    }

    headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }

    post '/api/v1/road_trip', headers: headers, params: body.to_json
    expect(response).to be_successful

    trip = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(trip).to have_key(:id)
    expect(trip[:id]).to be_nil

    expect(trip).to have_key(:type)
    expect(trip[:type]).to eq('road_trip')

    expect(trip).to have_key(:attributes)
    expect(trip[:attributes]).to be_a(Hash)

    attributes = trip[:attributes]

    expect(attributes).to have_key(:start_city)
    expect(attributes[:start_city]).to be_a(String)

    expect(attributes).to have_key(:end_city)
    expect(attributes[:end_city]).to be_a(String)

    expect(attributes).to have_key(:travel_time)
    expect(attributes[:travel_time]).to be_a(String)
    expect(attributes[:travel_time]).to eq('impossible')

    expect(attributes).to have_key(:weather_at_eta)
    expect(attributes[:weather_at_eta]).to be_a(Hash)
    expect(attributes[:weather_at_eta]).to be_empty
  end

  it 'can return unauthorized user if invalid key' do
    user_body = {
      "email": "whatever@example.com",
      "password": "password"
    }

    user = User.create!(user_body)

    body = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "wrong api key"
    }

    headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }

    post '/api/v1/road_trip', headers: headers, params: body.to_json

    expect(response).to_not be_successful
    expect(response.status).to eq(401)

    trip = JSON.parse(response.body, symbolize_names: true)

    expect(trip[:error]).to eq("invalid api_key")
  end
end
