class MunchiesFacade
  def self.munchie(params)
    start = params[:start]
    location = params[:end_location]
    food = params[:food]

    arrival_time = 1611074191 # TODO: Calculate arrival time using mapquest service

    munchie = {
      destination_city: location,
      arrival_time: arrival_time,
      weather: ForecastFacade.forecast(location),
      food: FoodService.food(food, location, arrival_time)
    }

    Munchie.new(munchie)
  end
end
