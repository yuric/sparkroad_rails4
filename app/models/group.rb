class Group < ActiveRecord::Base
  belongs_to :school
  has_many :group_items

  has_many :teaches, :class_name =>  "Teaches"
  has_many :teachers, :through => :teaches

end