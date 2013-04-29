class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.references :school

      t.timestamps
    end
    add_index :groups, :school_id
  end
end
