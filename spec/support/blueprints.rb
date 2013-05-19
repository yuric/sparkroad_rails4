require 'machinist/active_record'

Group.blueprint do
  name { "group-#{sn}" }
end
Student.blueprint do

end

Broadcast.blueprint do
  title { "broadcast-#{sn}" }
end

BroadcastMedium.blueprint do
  # Attributes here
end

BroadcastMessage.blueprint do
  # Attributes here
end
