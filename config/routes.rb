Rails.application.routes.draw do
  
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root to: 'toppages#index'
  
  #Userモデル アカウントの作成と取得と編集と削除
  get 'signup', to: 'users#new'
  
  resources :users
  
  #LoginとLogoutはRails提供のSessionコントローラーで作る
  get "login", to: 'sessions#new'
  post "login", to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  
  resources :tasks
  
end

