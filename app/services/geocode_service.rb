class GeocodeService
  def self.coordinates(location)
    response = conn.get('/geocoding/v1/address') do |req|
      req.params['location'] = location
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.directions(start, destination)
    response = conn.get('directions/v2/route') do |req|
      req.params['from'] = start
      req.params['to'] = destination
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('http://www.mapquestapi.com') do |f|
      f.params['key'] = ENV['GEOCODING_API_KEY']
    end
  end
end
