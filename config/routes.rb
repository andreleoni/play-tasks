Rails.application.routes.draw do
  resources :time_sheets
  namespace :api, defaults: { format: :json } do
    namespace :v0 do
      resources :projects
    end
  end

  resources :projects do
  	resources :tasks do
  		member do
  			patch :complete
  		end
  	end
  end

  root "projects#index"
end
