class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.references :parent_organization

      t.timestamps
    end
    add_index :schools, :parent_organization_id
  end
end
