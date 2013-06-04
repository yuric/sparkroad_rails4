class SchoolGroupItem < ActiveRecord::Base

  has_paper_trail :class_name => 'SchoolGroupItemVersion',
                  :meta => { :parent_id  => :parent_group_id }


  belongs_to :parent, :class_name => 'SchoolGroup'

  include GroupableItem

  def parent_group_id
    self.parent_id
  end
end
