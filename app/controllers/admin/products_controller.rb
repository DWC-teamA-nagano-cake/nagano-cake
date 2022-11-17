class Admin::ProductsController < ApplicationController

  def index
    @products = Product.page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    if product.save
      redirect_to admin_products
    end
  end

  private

  def product_params
    params.require(:product).permit(:genre_id, :is_active, :name, :description, :price)
  end

end
