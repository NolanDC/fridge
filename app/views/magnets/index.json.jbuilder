json.array!(@magnets) do |magnet|
  json.extract! magnet, :id, :x, :y, :word, :locked_until, :locked_by, :door_id
  json.url magnet_url(magnet, format: :json)
end
