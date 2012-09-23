class CreatePetSpecies < ActiveRecord::Migration
  def change
    create_table :pet_species do |t|
      t.string :name
      t.references :pet
      t.timestamps
    end
  end
end
