class CreateGroupItems < ActiveRecord::Migration
  def change
    create_table :group_items do |t|
      t.references :group

      t.timestamps
    end
    add_index :group_items, :group_id
  end
end
