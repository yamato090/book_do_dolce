Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'

  get "/home/about" => "homes#about"
  get 'users/unsubscribe' => 'users#unsubscribe'
  resources :users, except: [:new]
  resources :recipes, only: [:index, :create, :new, :show, :edit, :update, :destroy]
end
