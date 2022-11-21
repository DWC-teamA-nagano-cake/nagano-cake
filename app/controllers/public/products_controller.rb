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
    @search_genre = params[:genre]
    genre = Genre.where("genre LIKE?", @search_genre)
    @products_all = genre.inject(init = []){|result, genre| result + genre.products}
    @products = Kaminari.paginate_array(@products_all).page(params[:page]).per(8)
  end

end
