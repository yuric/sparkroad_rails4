class AddStudentAndParentToGroupItem < ActiveRecord::Migration
  def change
    add_reference :group_items, :student, index: true
    add_reference :group_items, :parent, index: true
  end
end
