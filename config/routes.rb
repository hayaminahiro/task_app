Rails.application.routes.draw do
  root 'static_pages#top'
  get    '/signup', to: 'users#new'
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  # 利用者一覧ページ
  get    '/users', to: 'users#index'
  
  resources :users do
    resources :tasks
  end
end
