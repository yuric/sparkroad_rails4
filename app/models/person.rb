class Person < ActiveRecord::Base

  has_many :accounts
  has_one :student

end
