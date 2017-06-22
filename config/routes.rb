Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v0 do
      get '/' => 'api#api_methods'
      get 'all_tasks' => 'tasks#all_tasks'
      
      resources :time_sheets, except: [:new, :edit]

      resources :projects, except: [:new, :edit] do
        resources :tasks, except: [:new, :edit] do
          member do
            patch :complete
          end
        end
      end
    end
  end

  resources :projects do
  	resources :tasks do
  		member do
  			patch :complete
  		end
  	end
  end

  resources :time_sheets

  root "projects#index"
end
