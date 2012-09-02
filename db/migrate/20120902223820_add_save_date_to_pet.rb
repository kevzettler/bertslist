class AddSaveDateToPet < ActiveRecord::Migration
  def change
    add_column :pets, :save_date, :date
  end
end
