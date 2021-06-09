Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'items#index'
  resources :items
  resources :carts, only: [:create, :update, :destroy, :show]
  resources :orders, only: [:new, :create, :destroy, :show]
  resources :cart_items
  get 'static_pages/contact'





end
