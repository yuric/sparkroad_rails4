class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.references :person, index: true
      t.timestamps
    end
  end
end
