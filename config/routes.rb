Rails.application.routes.draw do
  post 'comments', to: 'comments#create'
  post 'likes', to: 'likes#create'
  get 'posts/index/:num', to: 'posts#index'
  get 'posts/:id', to: 'posts#show'
  get 'users/create', to: 'users#create'
  post 'users', to: 'users#create'
  get 'users/delete', to: 'users#delete'
  get 'users/update', to: 'users#update'

  post '/login', to: 'auth#create'
  delete '/logout', to: 'auth#destroy'
  get '/profile', to: 'users#profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# from learn (https://learning.flatironschool.com/courses/1283/assignments/53399?module_item_id=102686)
# Rails.application.routes.draw do
#   namespace :api do
#     namespace :v1 do
#       resources :users, only: [:create]
#       post '/login', to: 'auth#create'
#       get '/profile', to: 'users#profile'
#     end
#   end
# end 