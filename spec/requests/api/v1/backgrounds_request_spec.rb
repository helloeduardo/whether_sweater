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

    expect(attributes).to have_key(:image)
    expect(attributes[:image]).to be_a(Hash)

    image = attributes[:image]

    expect(image).to have_key(:location)
    expect(image[:location]).to be_a(String)

    expect(image).to have_key(:image_url)
    expect(image[:image_url]).to be_a(String)

    expect(image).to have_key(:credit)
    expect(image[:credit]).to be_a(Hash)

    credit = image[:credit]

    expect(image).to have_key(:source)
    expect(image[:source]).to be_a(String)

    expect(image).to have_key(:author)
    expect(image[:author]).to be_a(String)

    expect(image).to have_key(:logo)
    expect(image[:logo]).to be_a(String)
  end
end
