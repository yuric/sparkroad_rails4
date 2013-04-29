class CreateParentOrganizations < ActiveRecord::Migration
  def change
    create_table :parent_organizations do |t|
      t.string :name

      t.timestamps
    end
  end
end
