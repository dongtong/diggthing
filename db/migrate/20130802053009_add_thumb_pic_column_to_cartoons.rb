class AddThumbPicColumnToCartoons < ActiveRecord::Migration
  	def self.up
	    add_attachment :cartoons, :thumb_pic
  	end

  	def self.down
    	remove_attachment :cartoons, :thumb_pic
  	end
end
