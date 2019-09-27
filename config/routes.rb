Rails.application.routes.draw do
  resources :expenses
  resources :deliveries
  post 'delivery_status', to: 'delivery#return_status'
  get 'billing', to: 'cost_centers#billing'
  resources :apps
  resources :cost_centers
  get 'login/:id', to: 'apps#get_token'
  get 'tracking/:id', to: 'emails#track', as: 'tracking'
  post 'send_mail', to: "emails#send_mail"
  get 'emails', to: 'emails#get_all_mails'
  get 'email_stats/:id', to: 'emails#mail_stats'
  post 'send_sms', to: "messages#send_message"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
