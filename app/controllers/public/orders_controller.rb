class Public::OrdersController < ApplicationController
  
  def new
    customer=current_customer
    @order=Order.new
    @shipping_addresses=customer.shipping_address.all
  end
  
  def confirm
    @order=Order.new(order_params)
    if params[:order][:select_address]=='0'
      @order.post_code=current_customer.post_code
      @order.name=current_customer.first_name+current_customer.last_name
      @order.address=current_customer.address
    elsif params[:order][:select_address]=='1'
      @address=ShippingAddress.find(params[:order][:shipping_address_id])
      @order.post_code=@address.post_code
      @order.name=@address.name
      @order.address=@address,address
    elsif params[:order][:select_address]=='2'
      @order.customer_id=current_customer.id
    end
    @cart_items=current_customer.cart_items.all
    @order_new=Order.new
    render :confirm
  end
  
  private
  
  def order_params
    params.require(:order).permit(:method_of_payment,:post_code,:address,:name)
  end
  
end
