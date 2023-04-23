class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]


  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @items = Item.all.order("created_at DESC")
  end

  def show
    @item = Item.find(params[:id])
  end


  private
  def item_params
    params.require(:item).permit(:title, :goods_detail, :category_id, :quality_id, :postage_id, :prefecture_id, :price, :image, :delivery_id,).merge(user_id: current_user.id)
  end


end
