class ApplicationController < ActionController::Base
  before_action :set_search
  before_action :configure_permitted_parameters, if: :devise_controller?


 private

  def set_search
    @q = Product.ransack(params[:q])
    @product = @q.result(distinct: true).page(params[:page]).per(8)
    # @product = @q.result.includes(:name).page(params[:page]).to_a.uniq

  end
#   ransackメソッドは検索ヘルパーメソッドである
# resultメソッドは検索結果を返すヘルパーメソッドである
# distinct: trueは、重複する検索結果を除外する役割を持つ

 protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number])
  end

end
