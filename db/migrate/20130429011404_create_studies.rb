class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|
      t.references :school, index: true
      t.references :student, index: true

      t.timestamps
    end
  end
end
