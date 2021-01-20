class Munchie
  attr_reader :destination_city

  def initialize(data)
    @destination_city = data[:destination_city]
    @total_time = data[:total_time]
    @weather = data[:weather]
    @food = data[:food]
  end

  def travel_time
    return "impossible" if @total_time.nil? || @total_time.zero? || @total_time = 1_000_000

    day = Time.at(@total_time).utc.day
    if day == 1
      Time.at(@total_time).utc.strftime("%k hours %M min")
    else
      "#{day - 1} days " + Time.at(@total_time).utc.strftime("%k hours %M min")
    end
  end

  def forecast
    {
      summary: @weather.current_weather.conditions,
      temperature: @weather.current_weather.temperature
    }
  end

  def restaurant
    {
      name: @food[:name],
      address: @food[:location][:display_address].join(", ")
    }
  end
end
