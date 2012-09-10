class CreatePetImages < ActiveRecord::Migration
  def change
    create_table :pet_images do |t|
      t.references :pet
      t.string "file_name"
      t.string "content_type"
      t.string "file_size"
      t.datetime "updated_at"
      t.timestamps
    end
    add_index :pet_images, :pet_id
  end
end
