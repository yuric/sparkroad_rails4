class School < ActiveRecord::Base
  belongs_to :parent_organization
  has_many :groups, :class_name => 'SchoolGroup'

  has_many :workers, :class_name => 'Work'
  has_many :teachers, :through => :workers

  has_many :studies
  has_many :students, :through => :studies

end
