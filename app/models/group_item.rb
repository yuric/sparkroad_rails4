class GroupItem < ActiveRecord::Base
  belongs_to :parent, :class_name => 'Group'

  include GroupableItem
end
