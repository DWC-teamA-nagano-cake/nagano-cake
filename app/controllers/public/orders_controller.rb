class Public::OrdersController < ApplicationController
  
  def new
    customer=current_customer
    @order=Order.new
    @shipping_addresses=customer.shipping_address.all
  end
  
  def confirm
    @order=Order.new(order_params)
  end
  
  private
  
  def order_params
    params.require(:order).permit(:method_of_payment,:post_code,:address,:name)
  end
  
end
