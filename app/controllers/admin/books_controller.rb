#-*- coding: utf-8 -*-
class Admin::BooksController < AdminController
  before_filter :authenticate_user!
  before_filter :set_curr_nav

  def list
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def show
  end

  def create
    @book = Book.new(params[:book])
    if @book.save
      redirect_to admin_books_list_url
    else
      render action: 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(params[:book])
      redirect_to admin_books_list_url
    else
      render action: 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to admin_books_list_url, notice: "资源删除成功"
  end

  private
  def set_curr_nav
    @curr_nav = 'books'
  end
end
