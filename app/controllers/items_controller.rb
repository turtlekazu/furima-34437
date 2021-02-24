class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :get_item, only: [:edit, :update, :show]
  before_action :set_to_root, only: [:edit, :update]

  def index
    @items = Item.includes(:user).order('id DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render action: :edit
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :sales_status_id, :shipping_fee_id, :prefecture_id,
                                 :scheduled_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

  def get_item
    @item = Item.find(params[:id])
  end

  def set_to_root
    redirect_to root_path if @item.user_id != current_user.id
  end
end
