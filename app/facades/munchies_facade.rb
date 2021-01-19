class MunchiesFacade
  def self.munchie(params)
    start = params[:start]
    location = params[:end_location]
    food = params[:food]

    directions = GeocodeService.directions(start, location)
    total_time = directions[:route][:realTime]
    arrival_time = (Time.now + total_time).to_i

    munchie = {
      destination_city: location,
      total_time: total_time,
      weather: ForecastFacade.forecast(location),
      food: FoodService.food(food, location, arrival_time)[:businesses].first
    }

    Munchie.new(munchie)
  end
end
