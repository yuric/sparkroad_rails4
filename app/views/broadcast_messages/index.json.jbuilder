json.array!(@broadcast_messages) do |broadcast_message|
  json.extract! broadcast_message, :broadcast_id, :broadcast_media_id, :all_media, :english_message, :spanish_message
  json.url broadcast_message_url(broadcast_message, format: :json)
end