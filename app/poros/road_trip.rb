class RoadTrip
  attr_reader :start_city, :end_city

  def initialize(data)
    @start_city = data[:start_city]
    @end_city = data[:end_city]
    @total_time = data[:total_time]
    @weather = data[:weather]
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

  def weather_at_eta
    return {} if @total_time.nil? || @total_time.zero? || @total_time = 1_000_000

    hour = Time.at(@total_time).utc.hour
    day = Time.at(@total_time).utc.day
    if day == 1 && hour < 8
      {
        temperature: @weather.hourly_weather[hour].temperature,
        summary: @weather.hourly_weather[hour].conditions
      }
    elsif day <= 5
      {
        temperature: @weather.daily_weather[day - 1].max_temp,
        summary: @weather.daily_weather[day - 1].conditions
      }
    else
      'Forecasts greater than 5 days are out of range'
    end
  end
end
