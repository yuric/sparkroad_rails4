json.array!(@broadcasts) do |broadcast|
  json.extract! broadcast, :title, :school_id
  json.url broadcast_url(broadcast, format: :json)
end