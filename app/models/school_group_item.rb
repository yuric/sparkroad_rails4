class SchoolGroupItem < ActiveRecord::Base
  belongs_to :parent, :class_name => 'SchoolGroup'

  include GroupableItem
end
