#-*- coding: utf-8 -*-
class Admin::CartoonsController < AdminController
  before_filter :authenticate_user!, :except => [:get_cartoons_list]
  
  def list
    @curr_nav = "cartoons_scraped"
    @cartoons = CartoonTmp.paginate(page: params[:page], per_page: 10)
  end

  def index
    @curr_nav = "cartoons"
    @cartoons = Cartoon.all
  end

  def new
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    Cartoon.transaction do
      @cartoon = Cartoon.find(params[:id])
      tmp_cartoon = CartoonTmp.where("title like ?", "%#{@cartoon.title}%").first
      tmp_cartoon && tmp_cartoon.update_attributes({scraped: false}) && @cartoon.destroy
    end
    redirect_to admin_cartoons_index_url
  end

  def import
    result = save_sexiaozu(params[:cartoon_tmp_id])
    if result
      
      render json: {state: :success}.to_json
    else
      render json: {state: :failed}.to_json
    end
  end

  def get_cartoons_list
    @cartoons = Cartoon.paginate(:page => params[:page], :per_page => params[:per_page])
    records = @cartoons.map{|cartoon| {
        bookId: cartoon.id,
        title: cartoon.title,
        downloadNumber: cartoon.download_number,
        bookSize: cartoon.original_pic_file_size,
        costMoney: cartoon.cost_money,
        thumbUrl: "http://#{request.host}#{cartoon.thumb_pic.url}.jpg",
        bookDetail: "http://#{request.host}#{cartoon.original_pic.url}.jpg"
    }}

    result = {
      code: "0",
      message: "Success",
      recordCount: records.size,
      records: records
    }
    render :json => result.to_json
  end
end
