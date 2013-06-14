class CreateBroadcastMedia < ActiveRecord::Migration
  def change
    create_table :broadcast_media do |t|
      t.string :name, null: false, limit: 20
      t.string :description, null: false, limit: 255

      t.timestamps
    end
  end
end
