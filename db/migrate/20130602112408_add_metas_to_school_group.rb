class AddMetasToSchoolGroup < ActiveRecord::Migration
  def change
    add_column :school_group_versions, :item_ids, :text
  end
end
