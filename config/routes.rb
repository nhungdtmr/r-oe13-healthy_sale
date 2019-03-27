Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    devise_for :users
    root "products#index"
    get "/help", to: "static_pages#help", as: :help
    get "/contact", to: "static_pages#contact", as: :contact
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :users, except: :new
    resources :products
    resources :carts
    resources :orders do
        resources :order_details
    end
  end
  namespace :admin do
    get "/add_product", to: "products#new"
    post "/add_product", to: "products#create"
    resources :users, except: :edit
    resources :products
  end
end
