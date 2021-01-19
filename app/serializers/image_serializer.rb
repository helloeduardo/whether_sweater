class ImageSerializer
  include JSONAPI::Serializer
  set_id { nil }
  attributes :location, :image_url, :credit
end
