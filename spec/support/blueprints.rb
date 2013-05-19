require 'machinist/active_record'

Group.blueprint do
  name { "group-#{sn}" }
end

GroupItem.blueprint do
  student
end

Student.blueprint do

end

Broadcast.blueprint do
  title { "broadcast-title#{sn}" }
  messages(1)
end

BroadcastMedium.blueprint do
  name { "bc_medium-name#{sn}" }
  description { "broadcast_medium-description#{sn}" }
end

BroadcastMessage.blueprint do
  english_message { "broadcast_medium-english_message#{sn}" }
  media
end

BroadcastItem.blueprint do
  # Attributes here
end
