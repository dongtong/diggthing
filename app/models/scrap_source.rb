class ScrapSource < ActiveRecord::Base
  attr_accessible :curr_page, :name, :src_url, :total_pages, :category_id
  belongs_to :category
  has_many :cartoons
end
