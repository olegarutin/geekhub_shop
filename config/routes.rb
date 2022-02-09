Rails.application.routes.draw do
  root 'products#index'

  resources :categories, only: %i[show] do
    resources :products, only: %i[index show]
  end
end
