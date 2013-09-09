#-*- coding: utf-8 -*-
class Admin::CategoriesController < AdminController
  before_filter :authenticate_user!
  def list
    @curr_nav == "category"
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to admin_categories_list_url, :notice => "添加分类成功"
    else
      render action: 'new'
    end
  end

  def edit
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]
    if @category.update_attributes params[:category]
      redirect_to admin_categories_list_url, :notice => "编辑分类成功"
    else
      render action: 'edit'
    end
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    redirect_to admin_categories_list_url
  end
end
