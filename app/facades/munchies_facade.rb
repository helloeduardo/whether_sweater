class MunchiesFacade
  def self.munchie(params)
    start = params[:start]
    location = params[:end_location]
    food = params[:food]

    arrival_time = (Time.now + 18000).to_i # TODO: Calculate arrival time using mapquest service

    munchie = {
      destination_city: location,
      arrival_time: arrival_time,
      weather: ForecastFacade.forecast(location),
      food: FoodService.food(food, location, arrival_time)[:businesses].first
    }

    Munchie.new(munchie)
  end
end
