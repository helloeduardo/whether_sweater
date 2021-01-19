RSpec.describe 'User Login Endpoint', type: :request do
  it 'can login a user' do
    body = {
      "email": "whatever@example.com",
      "password": "password"
    }

    headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }

    User.create!(body)
    post '/api/v1/sessions', headers: headers, params: body.to_json

    expect(response).to be_successful

    user = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(user).to have_key(:id)
    expect(user[:id]).to be_a String

    expect(user).to have_key(:type)
    expect(user[:type]).to eq('user')

    expect(user).to have_key(:attributes)
    expect(user[:attributes]).to be_a(Hash)

    attributes = user[:attributes]

    expect(attributes).to have_key(:email)
    expect(attributes[:email]).to be_a(String)

    expect(attributes).to have_key(:api_key)
    expect(attributes[:api_key]).to be_a(String)
  end

  it 'can return an error when password credentials are bad' do
    body = {
      "email": "whatever@example.com",
      "password": "password"
    }

    login_body = {
      "email": "whatever@example.com",
      "password": "A wrong PW"
    }

    headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }

    User.create!(body)
    post '/api/v1/sessions', headers: headers, params: login_body.to_json

    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user[:error]).to eq("invalid credentials")
  end

  it 'can return an error when email credentials are bad' do
    body = {
      "email": "whatever@example.com",
      "password": "password"
    }

    login_body = {
      "email": "wrong_whatever@example.com",
      "password": "password"
    }

    headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }

    User.create!(body)
    post '/api/v1/sessions', headers: headers, params: login_body.to_json

    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user[:error]).to eq("invalid credentials")
  end
end
