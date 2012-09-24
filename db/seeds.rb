# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


species = ["Cat", "Dog"]
species.each do |s|
  PetSpecies.create({:name => s})
end


100.times do |i|
  Pet.create({
               :name => "Pet#{i}",
               :age_years => rand(0..20),
               :age_months => rand(0..20),
               :age_confirmed => rand(0..1),
               :notes => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
               :save_date => Date.new(rand(2012..2015),rand(1..12),rand(1..20)),
               :pet_species_id => rand(1..PetSpecies.all.count)
             })
end

