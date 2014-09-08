json.extract! @door, :id, :name, :hex, :created_at, :updated_at
json.subscribers @door.subscribers.length
