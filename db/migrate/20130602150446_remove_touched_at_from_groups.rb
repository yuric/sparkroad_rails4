class RemoveTouchedAtFromGroups < ActiveRecord::Migration
  def change
    remove_column :school_groups, :touched_at, :datetime
  end
end
