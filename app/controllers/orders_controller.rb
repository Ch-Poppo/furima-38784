class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @purchase_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
  end

  def new
    @purchase_address = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
    # @purchase = Purchase.create(purchase_params)
    # Address.create(address_params)
    # redirect_to root_path消去予定
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :municipality, :house_number, :building, :telephone_number, :purchase_id).merge(user_id: current_user.id, item_id: params[:item_id])
    # params.permit(:item_id).merge(user_id: current_user.id)消去予定
  end


  # def address_params
  #   params.require(:address).permit(:post_code, :prefecture_id, :municipality, :house_number, :building, :telephone_number, :purchase_id).merge(purchase_id: @purchase.id)
  # end消去予定
end
