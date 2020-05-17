Rails.application.routes.draw do
  devise_for :accounts
  get "u/:user_name" => 'public#profile', as: :profile 
  resources :communities do
    resources :posts
  end
  resources :votes
  post "post/vote" => "votes#create"
  
  resources :comments, only: [:create]
  resources :subscriptions

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'public#index'
end
