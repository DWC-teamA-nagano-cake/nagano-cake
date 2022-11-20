class Public::ProductsController < ApplicationController

  def index
    @products = Product.all.page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end

  def searches
    @genres = Genre.all
    @search_name = params[:genre_name]
    @products_all = Genre.where(@search_name)
    @products = @products_all.page(params[:page]).per(8)
  end

end