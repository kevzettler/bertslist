class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age_years
      t.integer :age_months
      t.boolean :age_confirmed
      t.boolean :nokill, :default => false
      t.text :notes
      t.date :save_date
      t.references :user
      t.references :pet_species

      t.timestamps
    end
  end
end
