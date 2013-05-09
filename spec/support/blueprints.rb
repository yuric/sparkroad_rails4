require 'machinist/active_record'

Group.blueprint do
  name { "group-#{sn}" }
end
Student.blueprint do

end
