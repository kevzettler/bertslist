class AddPhoneToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :phome, :string
  end
end
