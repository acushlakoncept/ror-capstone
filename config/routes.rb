Rails.application.routes.draw do
  root 'home#index'

  resources :users, only: %i[new create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post 'opinion', to: 'opinions#create'
  post 'follow', to: 'followings#create'

  get 'users/:username', to: 'users#show', as: 'profile'


  if Rails.env.production?
    get '404', :to => 'application#page_not_found'
 end

end
