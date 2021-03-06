require 'machinist/active_record'

SchoolGroup.blueprint do
  name { "group-#{sn}" }
end

SchoolGroupItem.blueprint do
  parent { SchoolGroup.make }
  person
end

Person.blueprint do

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
