class GroupItem < ActiveRecord::Base
  belongs_to :parent, :class_name => 'Group'
  belongs_to :group
  belongs_to :student

  #validate :parent_multi_level_parenting


  private
  def parent_multi_level_parenting
    self.parent.multi_level_parenting
  end
end
