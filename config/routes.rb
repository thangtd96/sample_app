Rails.application.routes.draw do

  scope "(:locale)", locale: /en|vi/ do
    get "/static_pages/*page", to: "static_pages#show", as: :static_pages
    get "/signup", to: "users#new"
    resources :users
    root "users#index"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "logout", to: "sessions#destroy"
  end
end
