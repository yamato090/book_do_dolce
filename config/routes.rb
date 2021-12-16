Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'

  get "/home/about" => "homes#about"
  get 'users/unsubscribe' => 'users#unsubscribe'
  get '/search', to: 'searches#search' # 検索機能
  resources :users, except: [:new] do
    resource :relationships, only: [:create, :destroy]  # フォロー・フォロワー機能
    get 'followings' => 'relationships#followings', as: 'followings'  #　フォローリンク
    get 'followers' => 'relationships#followers', as: 'followers'  #  フォロワーリンク
  end
  resources :recipes do
    resource :favorites, only: [:create, :destroy] #いいね機能
      resources :recipe_comments, only: [:create, :destroy] #コメント機能
  end
end
