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
root to:"homes#top"

get "home/about"=>"homes#about",as:"about"

resources:products,only[:index,:show]

resources:costomers,only[:show,:edit,:update] do
  get "customers/unsubscribe"=>"costomers#unsubscribe",as:"unsubscribe"
  patch "customers/withdrawal"=>"customers#withdrawal",as:"withdrawal"
end

resources:cart_items,only[:index,:update,:destroy,:create] do
  delete "cart_items/destroy_all"=>"cart_items#destroy_all",as:"destroy_all"
end

resources:orders,only[:new,:create,:index,:show] do
  post "orders/confirm"=>"orders#confirm",as:"confirm"
  get "orders/complete"=>"orders#complete",as:"complete"
end

resources:sipping_addresses

# 管理者用
namespace :admin do
  get "homes#top"
end

namespace :admin do
  resources:products
end

namespace :admin do
  resources:genres,only[:index,:create,:edit,:update]
end

namespace :admin do
  resources:costomers,only[:index,:show,:edit,:update]
end

namespace :admin do
  resources:orders,only[:show,:update]
end

namespace :admin do
  resources:order_details,only[:update]
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
