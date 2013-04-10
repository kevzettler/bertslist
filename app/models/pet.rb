class Pet < ActiveRecord::Base
  belongs_to :organization
  belongs_to :pet_species
  has_many :pet_images, :dependent => :destroy
  acts_as_taggable_on :breeds
  
  attr_accessible :name, :notes, :images, :save_date, :pet_species_id, :nokill,
  :age_years, :age_months, :age_confirmed, :other_name, :gender, 
  :primary_breed_id, :secondary_breed_id, :age_days, :birthdate, :animal_type,
  :primary_color, :secondary_color, :eye_color, :size, :coat_type, 
  :distinctive_features, :spayed_neutered, :status, :intake_date, 
  :special_notes, :bonded_pair_with, :animal_id, :cruelty_case, 
  :adoption_fee, :location_cage, :intake_reason, :original_owner, 
  :behavior_attributes, :health_prognosis, :known_health_issues, 
  :medications_treaments, :dietary_restrictions, :felv_status, :fiv_status, 
  :felv_fiv_date, :fvrcp_vaccination_date1, :fvrcp_vaccination_date2, 
  :fvrcp_vaccination_date3, :rabies_vaccination_date, :heartworm_test_date, 
  :flea_medication_date, :flea_medication_type, :dewormed_date, 
  :dewormer_type, :license, :microchip_company, :microchip_number, 
  :bio_story, :death_date, :death_reason

  accepts_nested_attributes_for :pet_images, :reject_if => lambda{|p| p['pet_image'].nil?}, :allow_destroy => true

  validates :name, :presence => true

  replicate_associations :pet_images

  def craigslist_post
    Resque.enqueue(Craigslist)
  end
end
