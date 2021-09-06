Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :posts

  get "user_posts", to: "posts#user_posts", as: "user_posts"

  resources :cleaning_stations, only: :index
end
