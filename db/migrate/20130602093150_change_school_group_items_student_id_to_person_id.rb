class ChangeSchoolGroupItemsStudentIdToPersonId < ActiveRecord::Migration
  def up
    remove_column :school_group_items, :student_id, :integer
    add_reference :school_group_items, :person, index: true
  end

  def down
    add_reference :school_group_items, :student, :index => true
    remove_column :school_group_items, :person_id
  end
end
