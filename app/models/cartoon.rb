#-*- coding: utf-8 -*-
class Cartoon < ActiveRecord::Base
  extend ScrapWorm
  #attr_accessor :original_file_name
  attr_accessible :cost_money, :download_number, :title, :thumb_pic, :original_pic
  has_attached_file :thumb_pic, 
                    :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/png"] },
                    :default_url => "/images/:style/missing.png"
                    # :url => "/thumbnails/:id/:basename.:extension",
                    # :path => ":rails_root/public/thumbnails/:id/:basename.:extension" 
                    
  has_attached_file :original_pic, 
                    :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/png"] },
                    :default_url => "/images/:style/missing.png"
                    # :url => "/originals/:id/:basename.:extension",
                    # :path => ":rails_root/public/originals/:id/:basename.:extension"  


  scope :lastest_cartoons, lambda {where("created_at > ?", 2.days.ago)}
  
  def self.scrap_and_create_cartoons
    scrap({
      url: "http://xiaojiulou.com/sexiaozu/"
    })
  end

  def get_title
    return title.split(":")[1] if title.include?(":") 
    return title.split("：")[1] if title.include?("：") 
    return title
  end
end
