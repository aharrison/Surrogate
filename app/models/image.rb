class Image < ActiveRecord::Base
  belongs_to :album
  has_one :cover_of_album, :class_name => 'Album', :foreign_key => 'cover_image_id'
  cattr_reader :per_page
  @@per_page = 20
end
