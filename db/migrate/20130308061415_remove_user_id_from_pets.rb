class RemoveUserIdFromPets < ActiveRecord::Migration
  def up
    remove_column :pets, :user_id
  end

  def down
    add_column :pets, :user_id, :integer
  end
end
