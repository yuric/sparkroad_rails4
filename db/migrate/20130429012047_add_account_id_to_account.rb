class AddAccountIdToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :person_id, :integer
    add_index :accounts, :person_id
  end
end
