class BuyersController < ApplicationController
  before_action :set_item, only:[:index, :create]
  before_action :authenticate_user!

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    if @item.user == current_user || @item.buyer.present?
      redirect_to root_path
      return
    end
    @buyer_address = BuyerAddress.new
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      pay_item
      @buyer_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private
  
  def buyer_params
    params.require(:buyer_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number ).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: buyer_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
