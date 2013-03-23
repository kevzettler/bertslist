class CreateThirdParties < ActiveRecord::Migration
  def change
    create_table :third_parties do |t|
      t.string :name
      t.string :username
      t.string :password
      t.references :organization      

      t.timestamps
    end
  end
end
