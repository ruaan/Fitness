class Lineitem < ActiveRecord::Base
  #mount_uploader :image, PictureUploader

  belongs_to :subsection


end
