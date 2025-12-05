Rails.application.routes.draw do
  # トップページ
  root to: 'home#index'

  # ユーザー登録（signup）とログイン（login）
  get    'signup', to: 'users#new'
  post   'signup', to: 'users#create'
  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # 作品CRUD ＋ レビュー投稿
  resources :works do
    resources :reviews, only: [:create]
  end
end
