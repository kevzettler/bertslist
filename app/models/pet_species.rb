class PetSpecies < ActiveRecord::Base
  belongs_to :pet
  attr_accessible :name
  
end
