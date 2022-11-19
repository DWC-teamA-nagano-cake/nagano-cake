class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
   #管理者以外には処理してほしくないので、最初にadminかどうかを確認
  
  def show
    @order = Order.find(params[:id])
    @orders = Order.all
    @order_details = OrderDetail.where(order_id: @order.id)
    @order_new = Order.new
    @order_detail = OrderDetail.find(params[:id])
    @order_status_key = Order.order_statuses_i18n.invert
    @making_status_key = OrderDetail.making_statuses_i18n.invert
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.order_status == "confirmation"
      @order.order_details.update(making_status: 1)
    end
    redirect_to request.referer
  end


  private

  def order_params
    params.require(:order).permit(:order_status)
  end
  
end




 