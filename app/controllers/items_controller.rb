class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :category_id, :description, :status_id, :postage_id, :prefecture_id, :shopping_date_id,
                                 :price, :image).merge(user_id: current_user.id)
  end
end
