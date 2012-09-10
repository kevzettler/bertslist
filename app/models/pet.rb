class Pet < ActiveRecord::Base
  belongs_to :user
  has_many :pet_images, :dependent => :destroy
  
  attr_accessible :age, :name, :notes, :images, :save_date
  accepts_nested_attributes_for :pet_images, :reject_if => lambda{|p| p['pet_image'].nil?}

  validates :name, :presence => true
  validates :save_date, :presence => true
end
