RSpec.describe 'Backgrounds Endpoint', type: :request do
  it "can return a background image for the city", :vcr do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful

    image = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(image).to have_key(:id)
    expect(image[:id]).to be_nil

    expect(image).to have_key(:type)
    expect(image[:type]).to eq('image')

    expect(image).to have_key(:attributes)
    expect(image[:attributes]).to be_a(Hash)


    attributes = image[:attributes]

    expect(attributes).to have_key(:location)
    expect(attributes[:location]).to be_a(String)

    expect(attributes).to have_key(:image_url)
    expect(attributes[:image_url]).to be_a(String)

    expect(attributes).to have_key(:credit)
    expect(attributes[:credit]).to be_a(Hash)

    credit = attributes[:credit]

    expect(credit).to have_key(:source)
    expect(credit[:source]).to be_a(String)

    expect(credit).to have_key(:author)
    expect(credit[:author]).to be_a(String)

    expect(credit).to have_key(:logo)
    expect(credit[:logo]).to be_a(String)
  end
end
