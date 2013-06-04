class RenameGroupToSchoolGroup < ActiveRecord::Migration
  def change
    rename_table :groups, :school_groups
  end
end
