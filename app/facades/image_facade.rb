class ImageFacade
  def self.image(location)
    image_details = ImageService.image(location)
    Image.new(image_details)
  end
end
