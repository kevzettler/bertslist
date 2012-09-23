class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age_years, :default => 0
      t.integer :age_months, :default => 0
      t.boolean :age_confirmed, :default => true
      t.boolean :nokill, :default => false
      t.text :notes
      t.date :save_date
      t.references :user
      t.references :pet_species

      t.timestamps
    end
  end
end
