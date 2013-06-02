class Teaches < ActiveRecord::Base
  belongs_to :school_group
  belongs_to :teacher
end
