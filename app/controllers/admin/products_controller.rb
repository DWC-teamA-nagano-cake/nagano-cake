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
    product.save
    redirect_to admin_products
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    product.update(product_params)
    redirect_to admin_products
  end

  private

  def product_params
    params.require(:product).permit(:genre_id, :is_active, :name, :description, :price)
  end

end
