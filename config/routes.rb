Rails.application.routes.draw do
  root to: "posts#index"
  get '/myindex', to: 'posts#myindex'
  devise_for :users
  resources :posts
end
