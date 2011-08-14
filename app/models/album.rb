class Album < ActiveRecord::Base
  has_many :images
  belongs_to :cover_image, :class_name => 'Image', :foreign_key => 'cover_image_id'

  def cover_thumbnail_path
    if cover_image then "/images/#{cover_image.id}_thumbnail.jpg" end
  end
end
