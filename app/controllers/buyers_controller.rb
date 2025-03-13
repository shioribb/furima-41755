class BuyersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @buyer_address = BuyerAddress.new
  end
end
