class Admin::SectionsController < AdminController
  before_filter :authenticate_user!
  before_filter :set_curr_nav

  def index
    @book = Book.find(params[:book_id])
    @sections = @book.sections
  end

  def new
    @book = Book.find(params[:book_id])
    @section = Section.new
  end

  def show
    @section = Section.find(params[:id])
  end

  def create
    @section = Section.new(params[:section])
    if @section.save
      redirect_to admin_book_sections_url
    else
      render action: 'new'
    end
  end

  def edit
    @book = Book.find(params[:book_id])
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(params[:section])
      redirect_to admin_book_sections_url
    else
      render action: 'edit'
    end
  end

  def destroy
  end

  private
  def set_curr_nav
    @curr_nav = 'books'
  end
end
