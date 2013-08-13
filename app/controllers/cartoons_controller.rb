#-*- coding: utf-8 -*-
class CartoonsController < ApplicationController
  def index
  	@cartoons = Cartoon.all
    @curr_nav = 'all'
    @title = I18n.t("cartoons.all_cartoon_title")
  end

  def show
    @curr_nav = params[:nav]
  	@cartoon = Cartoon.find(params[:id])
  end

  def download
  	@cartoon = Cartoon.find(params[:id])
  	begin
  		@cartoon.download_number += 1
  		@cartoon.save
  		send_file("#{Rails.root}/public#{@cartoon.original_pic.url.split('?')[0]}", filename: @cartoon.title,
  	          type: @cartoon.original_pic_content_type, :disposition => :attachment)
  	rescue => ex
      puts "**** #{ex.inspect}"
  		flash[:notice] = "图片不存在"
    	redirect_to root_path
  	end
  end

  def get_hot
    @curr_nav = 'hot'
    @cartoons = Cartoon.order("download_number desc").take(10)
    @title = I18n.t("cartoons.hot_cartoon_title")
    render :index
  end

  def get_lastest
    @curr_nav = 'lastest'
    @cartoons = Cartoon.lastest_cartoons
    @title = I18n.t("cartoons.lastest_cartoon_title")
    render :index
  end
end
