class Categorization < ActiveRecord::Base
  belongs_to :product
  belongs_to :subsection
end
