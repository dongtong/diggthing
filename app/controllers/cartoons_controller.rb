#-*- coding: utf-8 -*-
class CartoonsController < ApplicationController
  caches_page :index, :get_hot, :get_lastest
  before_filter(only: [:index, :get_hot, :get_lastest]) {@page_cached = true}
  cache_sweeper :cartoon_sweeper
  def index
    @curr_nav = params[:nav].blank? ? 'all' : params[:nav]
    case @curr_nav
    when 'hot'
      @cartoons = Cartoon.where('download_number >= ?', 11000).order("download_number desc").paginate(page: params[:page], per_page: 9)
    when 'lastest'
      @cartoons = Cartoon.lastest_cartoons.paginate(page: params[:page], per_page: 9)
    else
      @cartoons = Cartoon.order("created_at desc").paginate(page: params[:page], per_page: 9)
    end
    @title = I18n.t("cartoons.all_cartoon_title")
    sleep 1 #for cache
  end

  def show
    @curr_nav = params[:nav]
  	@cartoon = Cartoon.find(params[:id])
    @cartoon.update_attributes({
      download_number: @cartoon.download_number + 1,
      download_times: (@cartoon.download_times || 0) + 1
    })
  end

  def download
  	@cartoon = Cartoon.find(params[:id])
  	begin
  		@cartoon.download_number += 1
  		@cartoon.save
  		send_file("#{Rails.root}/public#{@cartoon.original_pic.url.split('?')[0]}", filename: @cartoon.title,
  	          type: @cartoon.original_pic_content_type, :disposition => :attachment)
  	rescue => ex
  		flash[:notice] = "图片不存在"
    	redirect_to root_path
  	end
  end

  def download_apk
    @app = App.last
    begin
      send_file("#{Rails.root}/public#{@app.apk.url.split('?')[0]}", filename: "#{@app.name}.apk",
              type: @app.apk_content_type, :disposition => :attachment)
    rescue => ex
      flash[:notice] = "APK不存在"
      redirect_to root_path
    end
  end

  def check
    @cartoon_id = params[:id]
  end

  def check_list
    @curr_nav = params[:nav]
  end
end
