class Organization < ActiveRecord::Base
  has_one :address, :as => :addressable
  has_many :users
  has_many :pets
  accepts_nested_attributes_for :address
  attr_accessible :name 
  replicate_associations :pets
end
