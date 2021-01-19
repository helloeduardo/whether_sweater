class ImageFacade
  def self.image(location)
    image_details = ImageService.image(location)[:results].first
    Image.new(image_details, location)
  end
end
