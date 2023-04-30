class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  before_action :purchase_check, only: [:index]
  before_action :user_check, only: [:index]

  def index
  end

  def new
    @purchase_address = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_check
    @purchase_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
    if @item.purchase
      redirect_to root_path
    end
  end

  def user_check
    @purchase_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
     if current_user == @item.user
      redirect_to root_path
    end
  end

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :municipality, :house_number, :building, :telephone_number, :purchase_id).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item[:price],
        card: purchase_params[:token],
        currency: 'jpy'
      )
    end
end
