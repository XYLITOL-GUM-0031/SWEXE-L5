Rails.application.routes.draw do
  root 'top#main'

  get 'top/main'
  get 'top/login_form', to: 'top#login_form'
  post 'top/login', to: 'top#login'
  get 'top/logout', to: 'top#logout'

  post 'tweets/create', to: 'tweets#create'
  post 'tweets/:id/like', to: 'tweets#like', as: 'like_tweet'
  post 'tweets/:id/unlike', to: 'tweets#unlike', as: 'unlike_tweet'

  resources :users, only: [:new, :create, :show, :edit, :update]
end
