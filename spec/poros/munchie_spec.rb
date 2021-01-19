RSpec.describe Munchie do
  it "exists and has attributes", :vcr do
    response = File.read('spec/fixtures/poros/food_sample_response.json')

    location = 'denver,co'
    food = JSON.parse(response, symbolize_names: true)
    total_time = (Time.now + 18000).to_i

    data = {
      destination_city: location,
      total_time: total_time,
      weather: ForecastFacade.forecast(location),
      food: food[:businesses].first
    }

    munchie = Munchie.new(data)

    expect(munchie).to be_a Munchie
    expect(munchie.destination_city).to eq(location)
    expect(munchie.travel_time).to be_a String

    expect(munchie.forecast).to be_a Hash
    expect(munchie.forecast).to have_key :summary
    expect(munchie.forecast[:summary]).to be_a String
    expect(munchie.forecast).to have_key :temperature
    expect(munchie.forecast[:temperature]).to be_a Numeric

    expect(munchie.restaurant).to be_a Hash
    expect(munchie.restaurant).to have_key :name
    expect(munchie.restaurant[:name]).to be_a String
    expect(munchie.restaurant).to have_key :address
    expect(munchie.restaurant[:address]).to be_a String
  end
end
