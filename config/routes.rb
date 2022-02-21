Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'products#index'

  resources :users
  resources :product_categories, only: :show do
    resources :products, only: %i[index show]
  end
  resources :products do
    resources :order_items, only: %i[create update destroy]
  end
  resources :orders
  resources :comments, except: :show
end
