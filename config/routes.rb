Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    get "/admin", to: "songs#admin"
    post "/login", to: "admin#login"
    get "/auto_login", to: "admin#auto_login"
    resources :songs, only: [:index, :create, :show, :update, :destroy] do 
      resources :parts, only: [:index, :create, :show, :update, :destroy]
    end
  end
end
