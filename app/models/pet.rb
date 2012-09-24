class Pet < ActiveRecord::Base
  belongs_to :user
  belongs_to :pet_species
  has_many :pet_images, :dependent => :destroy
  acts_as_taggable_on :breeds
  
  attr_accessible :name, :notes, :images, :save_date, :pet_species_id, :nokill,
  :age_years, :age_months, :age_confirmed
  accepts_nested_attributes_for :pet_images, :reject_if => lambda{|p| p['pet_image'].nil?}, :allow_destroy => true

  validates :name, :presence => true
end
