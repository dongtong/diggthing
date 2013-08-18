class App < ActiveRecord::Base
  attr_accessible :name, :apk
  has_attached_file :apk, 
                    :content_type => { :content_type => ["application/vnd.android.package-archive"] },
                    :url => "/apps/:id/:basename.:extension",
                    :path => ":rails_root/public/apps/:id/:basename.:extension" 
end
