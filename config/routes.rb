Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    get "admin", to: "songs#admin_index"
    post "login", to: "admins#login"
    resources :songs, except: [:new, :edit] do 
      resources :parts, escept: [:new, :edit]
    end
  end
end
