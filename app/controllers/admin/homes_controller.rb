class Admin::HomesController < ApplicationController
  # before_action :authenticate_admin!

  def top
    @orders = Order.page(params[:page])
    # @order_new = Order.new
    order_details = OrderDetail.all
  end
end
