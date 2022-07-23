Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    post "login", to: "admins#login"
    resources :songs, except: [:new, :edit] do 
      resources :parts, except: [:new, :edit]
    end
    resources :choirs, only: [:show, :edit]
    resources :admins, except: [:new, :edit]
  end
end
