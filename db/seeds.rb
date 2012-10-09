# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


species = ["Cat", "Dog", "Bunny"]
species.each do |s|
  PetSpecies.create({:name => s})
end

u = User.create({
  :email => "support@bertslist.com",
  :password => "babybert",
})

u.address = Address.create({
  :line1 => "724 wesley way",
  :line2 => "#6",
  :city => "Oakland",
  :state => "CA",
  :zip => "94610"
  })

u.add_flag('verified')
u.save

pet_json = "[{\"age_confirmed\":true,\"age_months\":0,\"age_years\":3,\"name\":\"Toots\",\"nokill\":false,\"notes\":\"Toots is awesome.\",\"pet_species_id\":1,\"save_date\":null},{\"age_confirmed\":true,\"age_months\":0,\"age_years\":6,\"name\":\"Mr. Meow\",\"nokill\":false,\"notes\":\"Mr. Meow loves chop suey.\",\"pet_species_id\":1,\"save_date\":null},{\"age_confirmed\":true,\"age_months\":0,\"age_years\":5,\"name\":\"Mop\",\"nokill\":false,\"notes\":\"Mop loves other cats. And brooms.\",\"pet_species_id\":1,\"save_date\":null},{\"age_confirmed\":true,\"age_months\":0,\"age_years\":4,\"name\":\"Carlton\",\"nokill\":false,\"notes\":\"Carlton loves ties.\",\"pet_species_id\":1,\"save_date\":null},{\"age_confirmed\":true,\"age_months\":0,\"age_years\":3,\"name\":\"Fred\",\"nokill\":false,\"notes\":\"Fred is nice and very friendly.\",\"pet_species_id\":1,\"save_date\":null},{\"age_confirmed\":true,\"age_months\":0,\"age_years\":8,\"name\":\"Emeril\",\"nokill\":false,\"notes\":\"He loves eating.\",\"pet_species_id\":1,\"save_date\":\"2012-03-10\"}]"
#pet_image_json = "[{\"content_type\":null,\"file_name\":null,\"file_size\":null,\"pet_id\":1,\"photo_content_type\":\"image/jpeg\",\"photo_file_name\":\"toots.JPG\",\"photo_file_size\":12079,\"photo_updated_at\":\"2012-09-26T02:36:21Z\"},{\"content_type\":null,\"file_name\":null,\"file_size\":null,\"pet_id\":2,\"photo_content_type\":\"image/jpeg\",\"photo_file_name\":\"mr_meow.jpg\",\"photo_file_size\":43022,\"photo_updated_at\":\"2012-09-26T02:37:04Z\"},{\"content_type\":null,\"file_name\":null,\"file_size\":null,\"pet_id\":3,\"photo_content_type\":\"image/jpeg\",\"photo_file_name\":\"mop_(1).jpg\",\"photo_file_size\":7724,\"photo_updated_at\":\"2012-09-26T02:37:31Z\"},{\"content_type\":null,\"file_name\":null,\"file_size\":null,\"pet_id\":4,\"photo_content_type\":\"image/jpeg\",\"photo_file_name\":\"carlton.jpg\",\"photo_file_size\":50190,\"photo_updated_at\":\"2012-09-26T02:38:05Z\"},{\"content_type\":null,\"file_name\":null,\"file_size\":null,\"pet_id\":5,\"photo_content_type\":\"image/jpeg\",\"photo_file_name\":\"fred.jpg\",\"photo_file_size\":36646,\"photo_updated_at\":\"2012-09-26T02:38:34Z\"},{\"content_type\":null,\"file_name\":null,\"file_size\":null,\"pet_id\":6,\"photo_content_type\":\"image/jpeg\",\"photo_file_name\":\"emeril_(1).jpg\",\"photo_file_size\":43450,\"photo_updated_at\":\"2012-09-26T02:39:40Z\"}]"
pet_images = Dir.glob("#{::Rails.root}/db/fixtures/*")

Pet.create(JSON.parse(pet_json))

Pet.all.each do |p|
  p.user_id = User.first.id

  image = PetImage.new()
  image.pet_id = p.id
  image
  image.

  p.save
end