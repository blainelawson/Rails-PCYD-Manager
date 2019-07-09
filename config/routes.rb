Rails.application.routes.draw do
  resources :directors
  resources :issues
  resources :committees
  resources :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
