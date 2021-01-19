RSpec.describe 'User Registration Endpoint', type: :request do
  it 'can register a user', :vcr do
    body = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }

    headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }

    post '/api/v1/users', headers: headers, params: body.to_json

    expect(response).to be_successful

    user = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(user).to have_key(:id)
    expect(user[:id]).to be_an Integer

    expect(user).to have_key(:type)
    expect(user[:type]).to eq('users')

    expect(user).to have_key(:attributes)
    expect(user[:attributes]).to be_a(Hash)

    attributes = user[:attributes]

    expect(attributes).to have_key(:email)
    expect(attributes[:email]).to be_a(String)

    expect(attributes).to have_key(:api_key)
    expect(attributes[:api_key]).to be_a(String)
  end
end
