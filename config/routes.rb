Rails.application.routes.draw do
  devise_for :users
  root 'pins#index'
  resources :pins do
    member do
      put "like", to: "pins#upvote"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
