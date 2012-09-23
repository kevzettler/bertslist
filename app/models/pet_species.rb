class PetSpecies < ActiveRecord::Base
  has_many :pets
  attr_accessible :name
  
end
