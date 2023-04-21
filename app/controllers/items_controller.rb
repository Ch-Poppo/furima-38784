class ItemsController < ApplicationController
  before_action :redirect_to_login, only: [:new]
  before_action :authenticate_user!, except: [:new, :index]

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
    params.require(:item).permit(:title, :goods_detail, :category_id, :quality_id, :postage_id, :prefectures_id, :price, :image, :delivery_id,)
  end

  def redirect_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end

end
