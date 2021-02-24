class OrdersController < ApplicationController
  def index
  end

  def create
    @order = Order.create(user_id: current_user.id, item_id: params[:item_id])
    @shipping = Shipping.new(shipping_params.merge(order_id: @order.id))
    binding.pry
    if @shipping.save
      redirect_to root_path
    else
      @order.destroy
      render action: :index
    end
  end

  private

  def shipping_params
    params.require(:shipping).permit(:postal_code, :prefecture_id, :city, :address_line1, :address_line2, :phone_number)
  end
end
