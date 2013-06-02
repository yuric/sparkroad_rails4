class SchoolGroupItem < ActiveRecord::Base

  has_paper_trail :class_name => 'SchoolGroupItemVersion'

  belongs_to :parent, :class_name => 'SchoolGroup'

  include GroupableItem
end
