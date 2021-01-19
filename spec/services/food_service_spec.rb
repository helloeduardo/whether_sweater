RSpec.describe FoodService, :vcr do
  it 'can get an open restaurant of specific food type in a destination city' do
    food = "chinese"
    location = "denver, co"
    arrival_time = 1611074191

    response = FoodService.food(food, location, arrival_time)

    expect(response).to be_a Hash

    expect(response).to have_key(:businesses)
    expect(response[:businesses]).to be_an Array

    expect(response[:businesses].first).to be_a Hash

    expect(response[:businesses].first).to have_key(:name)
    expect(response[:businesses].first[:name]).to be_a(String)

    expect(response[:businesses].first).to have_key(:location)
    expect(response[:businesses].first[:location]).to be_a(Hash)

    expect(response[:businesses].first[:location]).to have_key(:display_address)
    expect(response[:businesses].first[:location][:display_address]).to be_an(Array)

    expect(response[:businesses].first[:location][:display_address].first).to be_a(String)
  end
end
