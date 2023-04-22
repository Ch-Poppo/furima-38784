class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]


  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def item_params
    params.require(:item).permit(:title, :goods_detail, :category_id, :quality_id, :postage_id, :prefecture_id, :price, :image, :delivery_id,).merge(user_id: current_user.id)
  end


end
