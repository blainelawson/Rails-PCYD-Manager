Rails.application.routes.draw do 
  get '/auth/:provider/callback' => 'sessions#omniauth'

  root 'sessions#welcome'

  get '/login', :to => 'sessions#new'
  get '/logout', :to => 'sessions#destroy'
  
  get '/signup', :to => 'members#new'

  get '/members/:member_id/issues/edit_rank', :to => 'member_issues#edit_rank'
  post '/members/:member_id/issues/edit', :to => 'member_issues#update_rank'

  resources :members, except: [:show, :index] 
  
  resources :members, only: [:show, :index] do 
    resources :issues, only: [:new, :show, :index] 
    resources :committees, only: [:new, :show, :index]
  end




  resources :directors
  post '/directors/:id', :to => 'directors#delete'

  resources :issues

  resources :committees, except: [:show, :index]
  post '/committees/:id', :to => 'committees#delete'

  resources :committees, only: [:show, :index] do
    resources :members, only: [:new, :show, :edit, :index]
  end

  resources :admins do 
    resources :committees, only: [:new, :show, :edit, :index]
  end


  post 'sessions', :to => 'sessions#create'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # http://localhost:3000/rails/info/routes
end
