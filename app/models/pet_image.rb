class PetImage < ActiveRecord::Base
  belongs_to :pet
  has_attached_file :photo, PAPERCLIP_OPTIONS

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  attr_accessible :photo, :content_type, :photo_file_name, :file_name, :file_size, :pet_id, :photo_content_type, :photo_file_size, :photo_updated_at

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

  def to_base64
    ActiveSupport::Base64.encode64(open(self.photo.url) { |io| io.read })
  end

  def data_uri
    "data:#{self.photo.content_type};base64,"+self.to_base64
  end
end
