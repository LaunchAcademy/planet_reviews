Rails.application.routes.draw do
  root 'planets#index'
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :planets, only: [:new, :create, :show, :index]
  resources :reviews, only: [:create]
end
