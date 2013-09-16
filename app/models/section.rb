class Section < ActiveRecord::Base
  belongs_to :book
  attr_accessible :content, :book_id, :section_number, :name
end
