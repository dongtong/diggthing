#-*- coding: utf-8 -*-
class Admin::ScrapSourcesController < AdminController
  before_filter :authenticate_user!
  def list
    @scrap_sources = ScrapSource.all
  end

  def new
    @scrap_source = ScrapSource.new
  end

  def show
    @scrap_source = ScrapSource.find(params[:id])
  end

  def create
    @scrap_source = ScrapSource.new(params[:scrap_source])
    if @scrap_source.save
      redirect_to admin_scrap_sources_list_url, :notice => "创建抓取源成功"
    else  
      render action: 'new'
    end
  end

  def edit
    @scrap_source = ScrapSource.find(params[:id])
  end

  def update
    @scrap_source = ScrapSource.find(params[:id])
    if @scrap_source.update_attributes(params[:scrap_source])
      redirect_to admin_scrap_sources_list_url, :notice => "抓取源更新成功"
    else  
      render action: 'edit'
    end
  end

  def destroy
    @scrap_source = ScrapSource.find(:id)
    @scrap_source.destroy
    redirect_to admin_list_scrap_sources_url, notice: "资源删除成功"
  end
  
end
