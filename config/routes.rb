Rails.application.routes.draw do
  root 'details#new'
  resources :details
  resources :users

end
