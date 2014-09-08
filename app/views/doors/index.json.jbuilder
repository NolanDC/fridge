json.array!(@doors) do |door|
  json.extract! door, :name, :hex
  json.url door_url(door, format: :json)
  json.subscribers door.subscribers.length
end
