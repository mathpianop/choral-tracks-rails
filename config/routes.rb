Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :songs, except: [:index, :new, :edit] do 
      resources :parts, except: [:new, :edit]
    end
    resources :choirs, only: [:new]
    post "/admins/login", to: "admins#login"
    resources :admins, except: [:new, :edit]
  end
end
