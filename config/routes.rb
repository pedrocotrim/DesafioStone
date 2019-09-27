Rails.application.routes.draw do
  resources :apps
  resources :cost_centers
  get 'login/:id', to: 'apps#get_token'
  get 'tracking/:id', to: 'emails#track', as: 'tracking'
  post 'send_mail', to: "emails#send_mail"
  get 'emails', to: 'emails#get_all_mails'
  get 'email_stats/:id', to: 'emails#mail_stats'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
