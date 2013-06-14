class CreateBroadcastMessages < ActiveRecord::Migration
  def change
    create_table :broadcast_messages do |t|
      t.references :broadcast, index: true
      t.references :broadcast_media, index: true
      t.boolean :all_media, null: false, default: false
      t.text :english_message
      t.text :spanish_message

      t.timestamps
    end
  end
end
