class RoadTripFacade
  def self.trip(params)
    origin = params[:origin]
    destination = params[:destination]

    directions = GeocodeService.directions(origin, destination)

    trip = {
      start_city: origin,
      end_city: destination,
      total_time: directions[:route][:time],
      weather: ForecastFacade.forecast(destination)
    }

    RoadTrip.new(trip)
  end
end
