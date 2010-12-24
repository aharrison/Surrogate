class Image < ActiveRecord::Base
  belongs_to :album
  cattr_reader :per_page
  @@per_page = 1
end
