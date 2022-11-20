class ApplicationController < ActionController::Base
  before_action :search
  before_action :configure_permitted_parameters, if: :devise_controller?


  def search
    @search = Customer.ransack(params[:q])
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number])
  end

end
