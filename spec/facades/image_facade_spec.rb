RSpec.describe ImageFacade, :vcr do
  it 'returns an image' do
    location = 'denver,co'

    image = ImageFacade.image(location)

    expect(image).to be_an Image
  end
end
