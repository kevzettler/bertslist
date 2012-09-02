class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age
      t.text :notes
      t.date :save_date
      t.references :user

      t.timestamps
    end
  end
end
