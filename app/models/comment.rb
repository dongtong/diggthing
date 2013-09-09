class Comment < ActiveRecord::Base
  belongs_to :cartoon, touch: true #because cartoon details screen use fragment cache
  belongs_to :user
  belongs_to :book

  attr_accessible :content, :cartoon_id, :user_id, :book_id
  validates :content, :presence => true
end
