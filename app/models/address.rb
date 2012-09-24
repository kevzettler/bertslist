class Address < ActiveRecord::Base
  belongs_to :addressable, :polymorphic => true
  attr_accessible :addressable_id, :addressable_type, :city, :line1, :line2, :state, :zip, :name
end
