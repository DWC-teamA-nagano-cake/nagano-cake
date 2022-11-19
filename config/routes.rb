Rails.application.routes.draw do
# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

# 顧客用
scope module: :public do
	root to:"homes#top"
  get "about"=>"homes#about",as:"about"

end

scope module: :public do
  resources:products,only: [:index,:show]
end

scope module: :public do
  get 'customers/my_page' => 'customers#show'
  get 'customers/information/edit' => 'customers#edit'
  patch 'customers/information' => 'customers#update'


  get "customers/unsubscribe"=>"customers#unsubscribe",as:"unsubscribe"
  patch "customers/withdrawal"=>"customers#withdrawal",as:"withdrawal"
end
scope module: :public do
  resources:cart_items,only: [:index,:update,:destroy,:create] do
  delete "cart_items/destroy_all"=>"cart_items#destroy_all",as:"destroy_all"
  end
end

scope module: :public do
  resources:orders,only: [:new,:create,:index,:show] do
  post "orders/confirm"=>"orders#confirm",as:"confirm"
  get "orders/complete"=>"orders#complete",as:"complete"
  end
end

scope module: :public do
  resources:sipping_addresses
end

# 管理者用
namespace :admin do
  root to:'homes#top'

  resources:products

  resources:genres,only: [:index,:create,:edit,:update]

  resources:customers,only: [:index,:show,:edit,:update]

  resources:orders,only: [:show,:update]

  resources:order_details,only: [:update]
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


