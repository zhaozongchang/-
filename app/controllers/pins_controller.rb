class PinsController < ApplicationController
  def index
    @pins = Pin.all
  end

  def show
    @pin = Pin.find(params[:id])
  end

  def new
    @pin = Pin.new
  end

  def create
    @pin = Pin.new(pin_params)
    if @pin.save
    redirect_to pins_path, notice: "添加成功"
  else
    render :new
   end
  end

  def edit
    @pin = Pin.find(params[:id])
  end

  def update
    @pin = Pin.find(params[:id])
    if @pin.update
    redirect_to pins_path
  else
    render :edit
   end
  end

  def destroy
    @pin = Pin.find(params[:id])
    @pin.destroy
    redirect_to pins_path, alert: "删除成功"
  end 

  private

  def pin_params
    params.require(:pin).permit(:title, :description)
  end
end
