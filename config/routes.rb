Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'

  get "/home/about" => "homes#about"
  get 'users/unsubscribe' => 'users#unsubscribe'
  resources :users, except: [:new] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :recipes do
    resource :favorites, only: [:create, :destroy] #いいね機能
      resources :recipe_comments, only: [:create, :destroy] #コメント機能
  end
end
