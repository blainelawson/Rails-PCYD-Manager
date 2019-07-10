Rails.application.routes.draw do
  root 'sessions#welcome'

  get '/login', :to => 'sessions#new'

  post 'sessions', :to => 'sessions#create'
  
  resources :members, only: [:show, :index] do # What does this entire block make available for members?
    resources :issues, only: [:new, :show, :edit, :index]
  end

  resources :members, except: [:show, :index] # I need to do this again to make the rest of the routes available, yes??????

  resources :directors

  resources :issues

  resources :committees, only: [:show, :index] do
    resources :members, only: [:new, :show, :edit, :index]
  end

  resources :committees, except: [:show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # http://localhost:3000/rails/info/routes
end
