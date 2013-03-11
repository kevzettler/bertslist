class RemovePhoneFromAddress < ActiveRecord::Migration
  def up
    remove_column :addresses, :phone
  end

  def down
    add_column :addresses, :phone, :string
  end
end
