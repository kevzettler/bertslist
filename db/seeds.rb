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

# u = User.create({
#   :email => "support@bertslist.com",
#   :password => "babybert",
# })

# u.address = Address.create({
#   :line1 => "724 wesley way",
#   :line2 => "#6",
#   :city => "Oakland",
#   :state => "CA",
#   :zip => "94610"
#   })

# u.add_flag('verified')
# u.save