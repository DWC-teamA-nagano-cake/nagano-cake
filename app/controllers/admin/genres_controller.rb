class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def new
    @genre = Genre.new
  end

  def create
    product = Genre.new(product_params)
    if product.save
      redirect_to admin_products
    end
  end

  private

  def product_params
    params.require(:product).permit(:genre_id, :is_active, :name, :description, :price)
  end
end
