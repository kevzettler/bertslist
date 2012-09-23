class Pet < ActiveRecord::Base
  belongs_to :user
  has_many :pet_images, :dependent => :destroy
  has_one :pet_species
  
  attr_accessible :age, :name, :notes, :images, :save_date
  accepts_nested_attributes_for :pet_images, :reject_if => lambda{|p| p['pet_image'].nil?}, :allow_destroy => true

  validates :name, :presence => true
end
