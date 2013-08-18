#-*- coding: utf-8 -*-
class Admin::SystemController < AdminController
  before_filter(only: [:index, :show_upload_apk]) {@curr_nav = 'system'}
  def index
  	@apps = App.all
  end

  def show_upload_apk
  	@app = App.new
  end

  def edit_apk
  	@app = App.find(params[:id])
  end

  def update_apk
  	@app = App.find(params[:id])
  	if @app.update_attributes(params[:app])
  		redirect_to admin_system_index_url, :notice => "更新APK成功"
  	else
  		render action: 'edit_apk'
  	end
  end

  def upload_apk
  	@app = App.new(params[:app])
  	if @app.save
  		redirect_to admin_system_index_url, :notice => "上传APK成功"
  	else
  		render action: 'show_upload_apk'
  	end
  end
end
