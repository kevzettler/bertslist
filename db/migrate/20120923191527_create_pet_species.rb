class CreatePetSpecies < ActiveRecord::Migration
  def change
    create_table :pet_species do |t|
      t.string :name
      t.timestamps
    end
  end
end
