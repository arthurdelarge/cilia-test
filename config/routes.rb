Rails.application.routes.draw do
  devise_for :admins
  resources :sales
  resources :products
  resources :clients
  #get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'home#index'
  
end
