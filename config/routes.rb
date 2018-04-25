Rails.application.routes.draw do
  resources :exercises, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'exercises#index'
end 
