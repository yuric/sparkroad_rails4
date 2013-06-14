class SchoolGroupItemCannotBeNull < ActiveRecord::Migration
  def change
    change_column_null :school_group_items, :parent_id, false
  end
end
