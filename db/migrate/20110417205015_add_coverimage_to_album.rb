class AddCoverimageToAlbum < ActiveRecord::Migration
  def self.up
    add_column :albums, :cover_image_id, :integer
  end

  def self.down
    remove_column :albums, :cover_image_id
  end
end
