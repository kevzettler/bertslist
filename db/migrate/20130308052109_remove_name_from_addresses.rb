class RemoveNameFromAddresses < ActiveRecord::Migration
  def up
    remove_column :addresses, :name
  end

  def down
    add_column :addresses, :name, :string
  end
end
