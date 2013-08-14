class Comment < ActiveRecord::Base
  belongs_to :cartoon
  belongs_to :user
  attr_accessible :content, :cartoon_id, :user_id
  validates :content, :presence => true
end
