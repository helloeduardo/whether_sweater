class Image
  attr_reader :location, :image_url

  def initialize(data, location)
    @location = location
    @image_url = data[:urls][:full]
    @author = data[:user][:username]
  end

  def credit
    {
      source: 'unsplash.com',
      author: @author,
      logo: 'https://unsplash-assets.imgix.net/marketing/press-logotype-stacked.svg?auto=format&fit=crop&q=60'
    }
  end
end
