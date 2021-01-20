class ImageService
  def self.image(location)
    response = conn.get('/search/photos') do |req|
      req.params['query'] = location
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.unsplash.com') do |f|
      f.params['client_id'] = ENV['IMAGE_API_KEY']
    end
  end
end
