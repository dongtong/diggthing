class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :scrap_sources
end
