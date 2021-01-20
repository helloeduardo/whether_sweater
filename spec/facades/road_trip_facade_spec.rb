RSpec.describe RoadTripFacade, :vcr do
  it 'returns a roadtrip' do
    params = {
      origin: 'denver,co',
      destination: 'pueblo,co'
    }

    roadtrip = RoadTripFacade.trip(params)

    expect(roadtrip).to be_a RoadTrip
  end
end
