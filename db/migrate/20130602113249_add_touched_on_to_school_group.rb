class AddTouchedOnToSchoolGroup < ActiveRecord::Migration
  def change
    add_column :school_groups, :touched_at, :datetime
  end
end
