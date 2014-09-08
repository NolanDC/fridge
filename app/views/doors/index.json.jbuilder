json.array!(@doors) do |door|
  json.extract! door, :id, :name, :hex
  json.url door_url(door, format: :json)
  json.subscribers door.subscribers.length
end
