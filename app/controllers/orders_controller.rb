class OrdersController < ApplicationController
  def index
  end

  def create
    @order = Item.find(params[:id]).order.new(order_params)
    @shipping = @order.shipping.new(shipping_params)
    if @order.save && @shipping.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  private

  def order_params
    params.merge(user_id: current_user.id)
  end

  def shipping_params
    params.require(:shipping).permit(:postal_code, :prefecture_id, :city, :address_line1, :address_line2, :phone_number)
  end
end
