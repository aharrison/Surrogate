class Album < ActiveRecord::Base
  has_many :images
  belongs_to :cover_image, :class_name => 'Image', :foreign_key => 'cover_image_id'
end
