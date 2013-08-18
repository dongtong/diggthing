class AddApkColumnToApps < ActiveRecord::Migration
	def self.up
	    add_attachment :apps, :apk
  	end

  	def self.down
    	remove_attachment :apps, :apk
  	end
end
