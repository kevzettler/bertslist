class AddOranizationIdToPets < ActiveRecord::Migration
  def change
    add_column :pets, :organization_id, :integer
  end
end
