#-*- coding: utf-8 -*-
class Cartoon < ActiveRecord::Base
  extend ScrapWorm
  #attr_accessor :original_file_name
  attr_accessible :scrap_source_id, :page_in, :show_times, :cost_money, :download_number, :title, :thumb_pic, :original_pic, :download_times
  has_attached_file :thumb_pic, 
                    :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/png"] },
                    :default_url => "/images/:style/missing.png",
                    :url => "/thumbnails/:id/:basename.:extension",
                    :path => ":rails_root/public/thumbnails/:id/:basename.:extension" 
                    
  has_attached_file :original_pic, 
                    :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/png"] },
                    :default_url => "/images/:style/missing.png",
                    :url => "/originals/:id/:basename.:extension",
                    :path => ":rails_root/public/originals/:id/:basename.:extension"  

  has_many :comments, dependent: :destroy
  belongs_to :scrap_source


  scope :lastest_cartoons, lambda {where("created_at > ?", 1.days.ago)}
  
  def self.scrap_sexiaozu
    category = Category.where('name=?', '内涵漫画').first_or_create!(name: '内涵漫画')
    scrap_sexiaozu_res({
      name: '笑酒楼-色小组漫画',
      url: 'http://xiaojiulou.com/sexiaozu/index.html',
      category_id: category.id
    })
  end

  def self.scrap_sexi
    category = Category.where('name=?', '内涵漫画').first_or_create!(name: '内涵漫画')
    scrap_sexi_res({
      name: '笑酒楼-色系军团漫画',
      url: 'http://xiaojiulou.com/sexi/index.html',
      category_id: category.id
    })
  end
end
