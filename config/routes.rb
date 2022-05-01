Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # devise_for :users
  root to: 'prototypes#index'
  resources :prototypes, only: [:new, :create,:show,:edit,:update,:destroy] do
     resources :comments, only: [:create]
  end   #別モデルのidをデータベースから取得するのではなくパスに送ってコントローラー内で値を取得するためにルーティングのネストが存在する。
  resources :users, only: [:show]   
  # resources :rooms, only: [:new, :create]
end
