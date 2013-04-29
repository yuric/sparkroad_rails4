class CreateTeaches < ActiveRecord::Migration
  def change
    create_table :teaches do |t|
      t.references :group, index: true
      t.references :teacher, index: true

      t.timestamps
    end
  end
end
