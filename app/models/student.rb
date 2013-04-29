class Student < ActiveRecord::Base
  belongs_to :person

  has_many :studies
  has_many :schools, :through => :studies
end
