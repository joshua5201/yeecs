Rails.application.routes.draw do
  namespace :admin do
    resources :categories
    resources :pages
    resources :post_categories
    resources :posts
    resources :members
    resources :member_categories
    resources :banners
    resources :link_blocks

    root to: "pages#index"
  end

  resources :pages, only: [:show] 
  resources :member_categories, only: [:show]
  resources :members, only: [:show]
  resources :posts, only: [:show, :index]
  resources :post_categories, only: [:show]
  get '/index', to: 'pages#index'
  root to: redirect('/index')
end
