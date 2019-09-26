Rails.application.routes.draw do
  resources :apps
  resources :cost_centers
  get 'login/:id', to: 'apps#get_token'
  get 'tracking/:id', to: 'emails#track'
  post 'send', to: "emails#send"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
