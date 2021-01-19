RSpec.describe ImageService, :vcr do
  it 'can get an image for a location' do
    location = 'denver,co'
    response = ImageService.image(location)

    expect(response).to be_a Hash

    expect(response).to have_key(:results)
    expect(response[:results]).to be_an Array

    expect(response[:results].first).to be_a Hash

    result = response[:results].first

    expect(result).to have_key(:urls)
    expect(result[:urls]).to be_a Hash

    expect(result[:urls]).to have_key(:full)
    expect(result[:urls][:full]).to be_a String

    expect(result).to have_key(:user)
    expect(result[:user]).to be_a Hash

    expect(result[:user]).to have_key(:username)
    expect(result[:user][:username]).to be_a String
  end
end
