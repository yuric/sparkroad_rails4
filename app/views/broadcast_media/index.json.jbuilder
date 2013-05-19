json.array!(@broadcast_media) do |broadcast_medium|
  json.extract! broadcast_medium, :name, :description
  json.url broadcast_medium_url(broadcast_medium, format: :json)
end