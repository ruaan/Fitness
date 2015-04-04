class Installcatagorizations < ActiveRecord::Base
  belongs_to :product
  belongs_to :install
end
