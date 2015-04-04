class Install < ActiveRecord::Base




  has_many :installcategorizations
  has_many :products, through: :installcategorizations

  accepts_nested_attributes_for :installcategorizations
end
