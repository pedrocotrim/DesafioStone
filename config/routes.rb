Rails.application.routes.draw do
  resources :apps
  resources :cost_centers
  get 'login/:id', to: 'apps#get_token'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
