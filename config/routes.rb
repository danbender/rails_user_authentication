UserAuth::Application.routes.draw do

  root to: 'users#new'

  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:create, :destroy]

end
