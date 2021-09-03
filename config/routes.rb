Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :posts

  get "users/:id/posts", to: "posts#my_posts", as: "user_posts"

  resources :fix_orders, only: :index
end
