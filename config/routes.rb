Rails.application.routes.draw do
  get 'users/:user_id/posts' => 'posts#index', as: 'user_posts'
  get 'users/:user_id/posts/:id' => 'posts#show', as: 'user_post'
  get 'users/' => 'users#index', as: 'users'
  get 'users/:id' => 'users#show', as: 'user'
end
