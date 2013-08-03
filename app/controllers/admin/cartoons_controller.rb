class Admin::CartoonsController < ApplicationController
  before_filter :authenticate_user!, :except => [:get_cartoons_list]
  
  def list
    @cartoons = CartoonTmp.all.blank? ? Cartoon.scrap_and_create_cartoons : CartoonTmp.all 
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
  end

  def import
    result = save_sexiaozu(params[:cartoon_tmp_id])
    #SexiaozuWorker.perform_async(params[:cartoon_tmp_id])
    #SexiaozuWorker.perform_in(10., params[:cartoon_tmp_id])
    render :text => "waiting..."
  end

  def get_cartoons_list
    @cartoons = Cartoon.all
    result = {
      code: "0",
      message: "Success",
      recordCount: @cartoons.size,
      records: @cartoons.map{|cartoon| {
        title: cartoon.title,
        downloadNumber: cartoon.download_number,
        bookSize: cartoon.original_pic_file_size,
        costMoney: cartoon.cost_money,
        thumbUrl: "http://#{request.host}#{cartoon.thumb_pic.url}.jpg",
        bookDetail: "http://#{request.host}#{cartoon.original_pic.url}.jpg"
      }}
    }
    render :json => result.to_json
  end
end
