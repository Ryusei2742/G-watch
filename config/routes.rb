Rails.application.routes.draw do
  root to: 'home#index'
  resources :works do
    resources :reviews, only: [:create]
  end
end
