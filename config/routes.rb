Rails.application.routes.draw do
  namespace :admin do
    resources :categories
    resources :members
    resources :member_categories
    resources :pages
    resources :posts
    resources :banners
    resources :link_blocks

    root to: "pages#index"
  end

  resources :pages, only: [:show] 
  resources :member_categories, only: [:show]
  resources :members, only: [:show]
  get '/index', to: 'pages#index'
  root to: redirect('/index')
end
