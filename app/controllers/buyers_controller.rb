class BuyersController < ApplicationController
  before_action :set_item, only:[:index, :create]
  before_action :authenticate_user!

  def index
    if @item.user == current_user
      redirect_to root_path
      return
    end
    @buyer_address = BuyerAddress.new
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      @buyer_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  
  def buyer_params
    params.require(:buyer_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number ).merge(user_id: current_user.id, item_id: @item.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
