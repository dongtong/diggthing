#-*- coding: utf-8 -*-
class Cartoon < ActiveRecord::Base
  extend ScrapWorm
  #attr_accessor :original_file_name
  attr_accessible :cost_money, :download_number, :title, :thumb_pic, :original_pic
  has_attached_file :thumb_pic, :default_url => "/images/:style/missing.png" 
  has_attached_file :original_pic, :default_url => "/images/:style/missing.png" 
  
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
