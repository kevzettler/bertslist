class AddAttachmentPhotoToPetImages < ActiveRecord::Migration
  def self.up
    change_table :pet_images do |t|
      t.has_attached_file :photo
    end
  end

  def self.down
    drop_attached_file :pet_images, :photo
  end
end
