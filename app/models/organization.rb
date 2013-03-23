class Organization < ActiveRecord::Base
  acts_as_taggable_on :flags
  has_one :address, :as => :addressable
  has_many :users
  has_many :pets
  has_many :third_parties
  accepts_nested_attributes_for :address
  attr_accessible :name,:phone,:email
  replicate_associations :pets, :flags

  def verified?
    self.flag_list.include? "verified"
  end

  def add_flag(flag)
    self.flag_list = self.flag_list.push(flag)
  end
end
