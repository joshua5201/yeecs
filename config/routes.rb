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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
