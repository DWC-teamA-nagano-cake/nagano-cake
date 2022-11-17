class Admin::OrderDetailsController < ApplicationController
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    if @order_detail.making_status == "production"
      @order_detail.order.update(order_status: 2)
    elsif OrderDetail.where(order_status :3)
    
  end
end
