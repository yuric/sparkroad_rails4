class AddMetaDataToSchoolGroupItemVersions < ActiveRecord::Migration
  def change
    add_column :school_group_item_versions, :parent_id, :integer
  end
end
