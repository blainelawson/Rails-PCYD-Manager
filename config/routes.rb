Rails.application.routes.draw do
  root 'sessions#welcome'

  resources :members, only: [:show, :index] do # What does this entire block make available for members?
    resources :issues, only: [:new, :show, :edit, :index]
  end

  resources :members # I need to do this again to make the rest of the routes available, yes??????

  resources :directors
  resources :issues
  resources :committees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
