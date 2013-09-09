class BooksController < ApplicationController
  def index
  	@books = Book.paginate(page: params[:page], per_page: 9)
  	@curr_nav = "books"
  end

  def show
  	@curr_nav = "books"
  	@book = Book.find(params[:id])
  end
end
