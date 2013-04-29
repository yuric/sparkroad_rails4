class Teacher < ActiveRecord::Base
  belongs_to :account

  has_many :jobs, :class_name => "Work"
  has_many :schools, :through => :jobs

  has_many :teaches
  has_many :groups, :through => :teaches

end
