class AddFieldsToPet < ActiveRecord::Migration
  def change
    add_column :pets, :other_name, :string
    add_column :pets, :gender, :string
    add_column :pets, :primary_breed_id, :integer
    add_column :pets, :secondary_breed_id, :integer
    # Age should be 3 inputs years months days
    add_column :pets, :age_days, :integer, :default => 0
    # Estimated age might already have in schema
    add_column :pets, :estimated_age, :boolean
    add_column :pets, :birthdate, :datetime
    add_column :pets, :animal_type, :string 
    add_column :pets, :primary_color, :string 
    add_column :pets, :secondary_color, :string 
    add_column :pets, :eye_color, :string
    add_column :pets, :size, :string
    add_column :pets, :coat_type, :string
    add_column :pets, :distinctive_features, :text
    add_column :pets, :spayed_neutered, :boolean
    add_column :pets, :status, :text
    add_column :pets, :intake_date, :datetime
    add_column :pets, :special_notes, :text
    # another pet the animal is paired with,
    add_column :pets, :bonded_pair_with, :integer
    add_column :pets, :animal_id, :integer
    add_column :pets, :cruelty_case, :boolean
    add_column :pets, :adoption_fee, :string
    add_column :pets, :location_cage, :string
    add_column :pets, :intake_reason, :string
    add_column :pets, :original_owner, :text
    add_column :pets, :behavior_attributes, :string
    add_column :pets, :health_prognosis, :string
    add_column :pets, :known_health_issues, :text
    add_column :pets, :medications_treaments, :text
    add_column :pets, :dietary_restrictions, :text
    add_column :pets, :felv_status, :string
    add_column :pets, :fiv_status, :string
    add_column :pets, :felv_fiv_date, :datetime
    add_column :pets, :fvrcp_vaccination_date1, :datetime
    add_column :pets, :fvrcp_vaccination_date2, :datetime
    add_column :pets, :fvrcp_vaccination_date3, :datetime
    add_column :pets, :rabies_vaccination_date, :datetime
    add_column :pets, :heartworm_test_date, :datetime
    add_column :pets, :flea_medication_date, :datetime
    add_column :pets, :flea_medication_type, :string
    add_column :pets, :dewormed_date, :datetime
    add_column :pets, :dewormer_type, :string
    add_column :pets, :license, :string
    add_column :pets, :microchip_company, :string
    add_column :pets, :microchip_number, :string
    add_column :pets, :bio_story, :text
    add_column :pets, :death_date, :datetime
    add_column :pets, :death_reason, :string
  end
end
