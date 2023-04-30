class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:create, :index]
  before_action :item_purchase, only: [:index]

  def index
    if current_user == @item.user
      if current_user == @item.user
        redirect_to root_path
      end
    end
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

  def item_purchase
    @purchase_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
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
