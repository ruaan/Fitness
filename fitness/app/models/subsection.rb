class Subsection < ActiveRecord::Base
  has_many :globals
  belongs_to :section
  has_many :categorizations
  has_many :products, :through => :categorizations
  #accepts_nested_attributes_for :categorizations


  has_many :lineitems


  #accepts_nested_attributes_for :lineitemscatagorizations
  #has_and_belongs_to_many :products
end
