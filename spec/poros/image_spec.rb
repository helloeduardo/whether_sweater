RSpec.describe Image do
  it "exists and has attributes" do
    response = File.read('spec/fixtures/poros/image_sample_response.json')

    location = 'denver,co'
    details = JSON.parse(response, symbolize_names: true)

    current_weather = Image.new(details[:results].first, location)

    expect(current_weather).to be_a Image
    expect(current_weather.location).to be_a String
    expect(current_weather.image_url).to be_a String
    expect(current_weather.credit).to be_a Hash

    expect(current_weather.credit).to have_key :source
    expect(current_weather.credit[:source]).to be_a String

    expect(current_weather.credit).to have_key :author
    expect(current_weather.credit[:author]).to be_a String

    expect(current_weather.credit).to have_key :logo
    expect(current_weather.credit[:logo]).to be_a String
  end
end
