class ScrapSource < ActiveRecord::Base
  attr_accessible :curr_page, :name, :src_url, :total_pages
end
