class FoodService
  def self.food(food, location, arrival_time)
    response = conn.get('/v3/businesses/search') do |req|
      req.params['term'] = food
      req.params['location'] = location
      req.params['open_at'] = arrival_time
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://api.yelp.com') do |f|
      f.headers['Authorization'] = ENV['YELP_API_KEY']
    end
  end
end
