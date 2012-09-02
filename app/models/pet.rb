class Pet < ActiveRecord::Base
  belongs_to :shelter
  attr_accessible :age, :name, :notes
end
