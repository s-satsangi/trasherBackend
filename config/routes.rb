Rails.application.routes.draw do
  resources :comments
  resources :likes
  resources :posts
  get 'users/create', to: 'users#create'
  get 'users/delete', to: 'users#delete'
  get 'users/update', to: 'users#update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
