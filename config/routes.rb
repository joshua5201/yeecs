Rails.application.routes.draw do
  devise_for :users
  mount Ckeditor::Engine => '/ckeditor'
  namespace :admin do
    resources :categories
    resources :pages
    resources :post_categories
    resources :posts
    resources :members
    resources :member_categories
    resources :member_departments
    resources :banners
    resources :albums
    resources :photos
    resources :link_blocks
    resources :affiliated_schools
    resources :lab_programs
    resources :users

    root to: "pages#index"
  end

  resources :pages, only: [:show] 
  resources :member_categories, only: [:show, :index]
  resources :members, only: [:show]
  resources :affiliated_schools, only: [:index]
  resources :lab_programs, only: [:index]
  resources :posts, only: [:show, :index]
  resources :post_categories, only: [:show]
  get '/gallery', to: 'gallery#index', as: 'gallery'
  get '/index', to: 'pages#index'
  root to: 'pages#index' 
end
