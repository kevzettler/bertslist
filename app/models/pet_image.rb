class PetImage < ActiveRecord::Base
  belongs_to :pet
  has_attached_file :photo, :styles => {:thumb => "150x150", :large => "300x300"}
  include Rails.application.routes.url_helpers

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  attr_accessible :photo

  def to_jq_upload
    {
      "name" => read_attribute(:file_name),
      "size" => read_attribute(:file_size),
      "url" => upload.url(:original),
      "delete_url" => upload_path(self),
      "delete_type" => "DELETE"
    }
  end
end
