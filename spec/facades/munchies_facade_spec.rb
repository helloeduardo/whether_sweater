RSpec.describe MunchiesFacade, :vcr do
  it 'returns a munchie' do
    params = {
      start: "denver,co",
      end_location: "pueblo,co",
      food: 'chinese'
    }

    munchie = MunchiesFacade.munchie(params)

    expect(munchie).to be_a Munchie
  end
end
