class Lineitemscatagorizations < ActiveRecord::Base

  belongs_to :subsection
  belongs_to :lineitem

end
