Rails.application.routes.draw do
  resources :categories
  root 'products#index'
end
