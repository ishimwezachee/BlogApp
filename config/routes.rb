Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do 
    get '/users/sign_out' => 'devise/sessions#destroy' 
  end
  root 'users#index'
  resources :users, only: %i[index show] do 
    resources :posts, only: %i[index new create show destroy]
  end

  resources :posts do
    resources :comments, only: %i[create destroy]
    resources :likes, only: %i[create]
  end

  resources :comments, only: %i[destroy]
  resources :likes, only: %i[destroy]
end