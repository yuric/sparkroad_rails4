class CreateBroadcasts < ActiveRecord::Migration
  def change
    create_table :broadcasts do |t|
      t.string :title, limit: 100, null: false
      t.references :school, index: true

      t.timestamps
    end
  end
end
