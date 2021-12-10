Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  root to: 'homes#top'

  get "/home/about" => "homes#about"
  get 'users/unsubscribe' => 'users#unsubscribe'
  resources :users, except: [:new] 

  resources :recipes do
    resource :favorites, only: [:create, :destroy] #いいね機能
      resources :recipe_comments, only: [:create, :destroy] #コメント機能
  end
end
