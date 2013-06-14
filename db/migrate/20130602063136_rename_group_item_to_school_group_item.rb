class RenameGroupItemToSchoolGroupItem < ActiveRecord::Migration
  def change
    rename_table :group_items, :school_group_items
  end
end
