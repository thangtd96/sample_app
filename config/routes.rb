Rails.application.routes.draw do

  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home", page: "home"
    get "/static_pages/*page", to: "static_pages#show", as: :static_pages
    get "/signup", to: "users#new"
    resources :users, only: %i(new create show)
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "logout", to: "sessions#destroy"
  end
end
