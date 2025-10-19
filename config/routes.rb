Rails.application.routes.draw do
  get "users/new"
  get "users/create"
  get 'top/main'
  root 'top#main'

  get 'top/login_form', to: 'top#login_form'
  post 'top/login', to: 'top#login'
  get 'top/logout', to: 'top#logout'

  post 'tweets/create', to: 'tweets#create'
  post 'tweets/:id/like', to: 'tweets#like', as: 'like_tweet'
  post 'tweets/:id/unlike', to: 'tweets#unlike', as: 'unlike_tweet'
  get 'users/new', to: 'users#new'
  post 'users/create', to: 'users#create'

end
