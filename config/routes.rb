Rails.application.routes.draw do
  root 'sessions#welcome'

  get '/login', :to => 'sessions#new'
  get '/logout', :to => 'sessions#destroy'
  
  get '/signup', :to => 'members#new'

  get '/members/:member_id/issues/edit_rank', :to => 'member_issues#edit_rank'
  post '/members/:member_id/issues/edit', :to => 'member_issues#update_rank'


  resources :members, only: [:show, :index] do # What does this entire block make available for members?
    resources :issues, only: [:new, :show, :index] 
  end


  resources :members, except: [:show, :index] # I need to do this again to make the rest of the routes available, yes??????

  resources :directors

  resources :issues

  resources :committees, except: [:show, :index]

  post '/committees/:id', :to => 'committees#delete'

  resources :committees, only: [:show, :index] do
    resources :members, only: [:new, :show, :edit, :index]
  end


  post 'sessions', :to => 'sessions#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # http://localhost:3000/rails/info/routes
end
