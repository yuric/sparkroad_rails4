class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.references :teacher, index: true
      t.references :school, index: true

      t.timestamps
    end
  end
end
