class PinsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :descroy]
  def index
    @pins = Pin.all.order("created_at DESC")
  end

  def show
    @pin = Pin.find(params[:id])
  end

  def new
    @pin = Pin.new
  end

  def create
    @pin = Pin.new(pin_params)
    @pin.user = current_user
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
    if @pin.update(pin_params)
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

  def upvote
    @pin = Pin.find(params[:id])
    @pin.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @pin = Pin.find(params[:id])
    @pin.downvote_by current_user
    redirect_to :back
  end

  private

  def pin_params
    params.require(:pin).permit(:title, :description, :image)
  end
end
