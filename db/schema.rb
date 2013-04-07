# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130401040611) do

  create_table "addresses", :force => true do |t|
    t.string   "line1"
    t.string   "line2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "lat"
    t.string   "long"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "addresses", ["addressable_type", "addressable_id"], :name => "index_addresses_on_addressable_type_and_addressable_id", :unique => true

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "phone"
    t.string   "email"
  end

  create_table "pet_images", :force => true do |t|
    t.integer  "pet_id"
    t.string   "file_name"
    t.string   "content_type"
    t.string   "file_size"
    t.datetime "updated_at",         :null => false
    t.datetime "created_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "pet_images", ["pet_id"], :name => "index_pet_images_on_pet_id"

  create_table "pet_species", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pets", :force => true do |t|
    t.string   "name"
    t.integer  "age_years",               :default => 0
    t.integer  "age_months",              :default => 0
    t.boolean  "age_confirmed",           :default => true
    t.boolean  "nokill",                  :default => false
    t.text     "notes"
    t.date     "save_date"
    t.integer  "pet_species_id"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.integer  "organization_id"
    t.string   "other_name"
    t.string   "gender"
    t.integer  "primary_breed_id"
    t.integer  "secondary_breed_id"
    t.integer  "age_days",                :default => 0
    t.boolean  "estimated_age"
    t.datetime "birthdate"
    t.string   "primary_color"
    t.string   "secondary_color"
    t.string   "eye_color"
    t.string   "size"
    t.string   "coat_type"
    t.text     "distinctive_features"
    t.boolean  "spayed_neutered"
    t.text     "status"
    t.datetime "intake_date"
    t.text     "special_notes"
    t.integer  "bonded_pair_with"
    t.integer  "animal_id"
    t.boolean  "cruelty_case"
    t.string   "adoption_fee"
    t.string   "location_cage"
    t.string   "intake_reason"
    t.text     "original_owner"
    t.string   "behavior_attributes"
    t.string   "health_prognosis"
    t.string   "known_health_issues"
    t.string   "medications_treaments"
    t.string   "dietary_restrictions"
    t.string   "felv_status"
    t.string   "fiv_status"
    t.datetime "felv_fiv_date"
    t.datetime "fvrcp_vaccination_date1"
    t.datetime "fvrcp_vaccination_date2"
    t.datetime "fvrcp_vaccination_date3"
    t.datetime "rabies_vaccination_date"
    t.datetime "heartworm_test_date"
    t.datetime "flea_medication_date"
    t.string   "flea_medication_type"
    t.datetime "dewormed_date"
    t.string   "dewormer_type"
    t.string   "license"
    t.string   "microchip_company"
    t.string   "microchip_number"
    t.text     "bio_story"
    t.datetime "death_date"
    t.string   "death_reason"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "third_parties", :force => true do |t|
    t.string   "name"
    t.string   "username"
    t.string   "password"
    t.integer  "organization_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "provider"
    t.string   "uid"
    t.integer  "organization_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
