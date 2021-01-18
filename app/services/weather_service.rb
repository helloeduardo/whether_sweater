class WeatherService
  def self.weather(coordinates)
    response = conn.get('/data/2.5/onecall') do |req|
      req.params['lat'] = coordinates[:lat]
      req.params['lon'] = coordinates[:lng]
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://api.openweathermap.org') do |f|
      f.params['appid'] = ENV['WEATHER_API_KEY']
      f.params['units'] = 'imperial'
    end
  end
end
