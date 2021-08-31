Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :posts

  get "users/:id/posts", to: "posts#my_posts", as: "user_posts"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
