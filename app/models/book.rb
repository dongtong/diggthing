class Book < ActiveRecord::Base
  attr_accessible :isbn, :download_link,:author, :book_coin, :name, :published, :published_at, :publisher, :contents, :cover, :attachment
  has_attached_file :cover, 
                    :url => "/books/:id/cover/:basename.:extension",
                    :path => ":rails_root/public/books/:id/cover/:basename.:extension" 

  has_attached_file :attachment, 
                    :url => "/books/:id/:basename.:extension",
                    :path => ":rails_root/public/books/:id/:basename.:extension" 
                    
  has_many :comments
  has_many :sections
end
