require 'machinist/active_record'

Group.blueprint do
  name { "group-#{sn}" }
end

Student.blueprint do

end

Broadcast.blueprint do
  title { "broadcast-title#{sn}" }
end

BroadcastMedium.blueprint do
  name { "bc_medium-name#{sn}" }
  description { "broadcast_medium-description#{sn}" }
end

BroadcastMessage.blueprint do
  english_message { "broadcast_medium-english_message#{sn}" }
  media
end
