Rails.application.routes.draw do
  
  resources :exercises, only: [:index]

  root :to => 'exercises#index'
  post '/user_exercises', to: 'exercises#show'

  post '/auth', to: 'auth#create'
  get '/current_user', to: 'auth#show'

  post '/current_session', to: 'editor_sessions#lookup'
  patch '/current_session', to: 'editor_sessions#update'
  patch 'remove_session', to: 'editor_sessions#delete'

  mount ActionCable.server => '/cable'
  post '/edits', to: 'edits#create'

end 
