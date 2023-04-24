class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_spec, only: [:edit, :show, :update, :destroy]
  before_action :redirect_unless_user, only: [:edit, :update, :destroy]


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
  end

  def edit
  end

  def update
      if @item.update(item_params)
        redirect_to item_path(@item.id)
      else
        render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end


  private
  def item_params
    params.require(:item).permit(:title, :goods_detail, :category_id, :quality_id, :postage_id, :prefecture_id, :price, :image, :delivery_id,).merge(user_id: current_user.id)
  end

  def item_spec
    @item = Item.find(params[:id])
  end

  def redirect_unless_user
  redirect_to root_path unless current_user == @item.user
  end
end
