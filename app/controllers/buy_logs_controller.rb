class BuyLogsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index]
  before_action :sold_out_index, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @buy_log_address = BuyLogAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_log_address = BuyLogAddress.new(buy_log_params)
    if @buy_log_address.valid?
      pay_item
      @buy_log_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def buy_log_params
    params.require(:buy_log_address).permit(:buy_log_id, :postal_code, :prefecture_id, :municipalities, :house_number, :tel_number, :building).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
  end

  def sold_out_index
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.buy_log.present?
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:price],
      card: buy_log_params[:token],
      currency: 'jpy'
    )
  end
end
