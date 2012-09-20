class PetImage < ActiveRecord::Base
  belongs_to :pet
  has_attached_file :photo, {
    :styles => {:thumb => "150x150", :large => "300x300"},
    :url => "/images/:class/:attachment/:id/:style_:filename",
    :path => ":rails_root/public/images/:class/:attachment/:id/:style_:filename"
  }

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  attr_accessible :photo

  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
      "name" => read_attribute(:photo_file_name),
      "size" => read_attribute(:photo_file_size),
      "thumbnail_url" => photo.url(:thumb),
      "url" => photo.url(:original),
      "delete_url" => pet_image_path(self),
      "delete_type" => "DELETE"
    }
  end
end
