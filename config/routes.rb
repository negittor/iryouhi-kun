Rails.application.routes.draw do
  root 'details#new'
  resources :details, except: :show
  resources :users, except: :show

end
