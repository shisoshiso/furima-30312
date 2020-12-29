class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :image, :description, :category_id, :item_status_id, :delivery_fee_id,
                                 :ship_from_area_id, :days_to_delivery_id, :price).merge(user_id: current_user.id)
  end
end
