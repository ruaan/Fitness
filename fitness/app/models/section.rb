class Section < ActiveRecord::Base
  has_many :subsections
  belongs_to :project


  def duplicate
    new_template = self.clone
    new_template.subsection << self.subsection.collect { |subsection| subsection.clone }
    new_template.save
  end
end
