class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.references :account, index: true

      t.timestamps
    end
  end
end
