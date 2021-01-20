class HourlyWeather
  attr_reader :time, :temperature, :wind_speed, :wind_direction, :conditions, :icon

  def initialize(data)
    @time = Time.zone.at(data[:dt]).strftime('%H:%M:%S')
    @temperature = data[:temp]
    @wind_speed = "#{data[:wind_speed]} mph"
    @wind_direction = "from #{degree_to_direction(data[:wind_deg])}"
    @conditions = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
  end

  def degree_to_direction(degree)
    directions = %w[N NNE NE ENE E ESE SE SSE S SSW SW WSW W WNW NW NNW]

    value = (degree / 22.5) + 0.5

    directions[value.to_i % 16]
  end
end
