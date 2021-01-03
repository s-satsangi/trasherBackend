Rails.application.routes.draw do
  post 'comments', to: 'comments#create'
  post 'likes', to: 'likes#create'
  get 'posts/index/:num', to: 'posts#index'
  get 'posts/:id', to: 'posts#show'
  get 'users/create', to: 'users#create'
  get 'users/delete', to: 'users#delete'
  get 'users/update', to: 'users#update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
