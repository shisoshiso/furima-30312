class BuyLogsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index]

  def index
    @buy_log_address = BuyLogAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_log_address = BuyLogAddress.new(buy_log_params)
    if @buy_log_address.valid?
      @buy_log_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def buy_log_params
    params.require(:buy_log_address).permit(:buy_log_id, :postal_code, :prefecture_id, :municipalities, :house_number, :tel_number, :building).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
  end
end
