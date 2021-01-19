class Munchie
  attr_reader :destination_city

  def initialize(data)
    @destination_city = data[:destination_city]
    @arrival_time = data[:arrival_time]
    @weather = data[:weather]
    @food = data[:food]
  end

  def travel_time
    Time.at(@arrival_time - Time.now).utc.strftime("%H hours %M min")
  end

  def forecast # TODO: Need to change this to be at arrival time
    {
      summary: @weather.current_weather.conditions,
      temperature: @weather.current_weather.temperature
    }
  end

  def restaurant
    {
      name: @food[:businesses].first[:name],
      address: @food[:businesses].first[:location][:display_address].join(", ")
    }
  end
end
