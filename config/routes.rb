Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  resources :planets, only: [:new, :create, :show]
  resources :reviews, only: [:create]
end
