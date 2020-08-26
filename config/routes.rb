Rails.application.routes.draw do
  root 'home#index'

  resources :users, only: %i[new create show]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'


  if Rails.env.production?
    get '404', :to => 'application#page_not_found'
 end
 
end
