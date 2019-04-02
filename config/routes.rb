Rails.application.routes.draw do
  root to: "posts#index"
  get '/posts/search', to: 'posts#search'
  get '/myindex', to: 'posts#myindex'
  devise_for :users
  resources :posts
end
