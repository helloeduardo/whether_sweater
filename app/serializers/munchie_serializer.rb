class MunchieSerializer
  include JSONAPI::Serializer
  set_id { nil }
  attributes :destination_city, :travel_time, :forecast, :restaurant
end
