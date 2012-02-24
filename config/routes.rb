App1::Application.routes.draw do

  root :to => 'home#index'

  resources :users
  resources :items

end
