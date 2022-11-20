class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items.all
    @total_price = CartItem.total_price(current_customer)
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items.all
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
      product = CartItem.find_by(product_id: params[:cart_item][:product_id], customer_id: current_customer.id)
    if  product
      product.update(quantity: product.quantity.to_i + params[:cart_item][:quantity].to_i)
    else
      cart_item = CartItem.new(cart_item_params)
      cart_item.customer_id = current_customer.id
      cart_item.save
    end
    redirect_to cart_items_path
  end

  private

    def cart_item_params
      params.require(:cart_item).permit(:product_id, :quantity)
    end

end
