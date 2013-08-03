class CartoonsController < ApplicationController
  def index
  	@cartoons = Cartoon.all
  end

  def show
  	@cartoon = Cartoon.find(params[:id])
  end
end
