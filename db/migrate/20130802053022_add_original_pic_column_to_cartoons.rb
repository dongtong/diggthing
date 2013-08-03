class AddOriginalPicColumnToCartoons < ActiveRecord::Migration
 	def self.up
	    add_attachment :cartoons, :original_pic
  	end

  	def self.down
    	remove_attachment :cartoons, :original_pic
  	end
end
