class CreateBroadcastItems < ActiveRecord::Migration
  def change
    create_table :broadcast_items do |t|
      t.references :broadcast, index: true
      t.references :student, index: true
      t.references :group, index: true

      t.timestamps
    end
  end
end
