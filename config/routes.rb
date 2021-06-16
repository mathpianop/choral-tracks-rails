Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    get "/admin-songs", to: "songs#admin_index"
    resources :songs, only: [:index, :create, :show, :destroy] do 
      resources :parts, only: [:index, :create, :show, :destroy]
    end
  end
end
