Rails.application.routes.draw do
  root 'pins#index'
  resources :pins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
