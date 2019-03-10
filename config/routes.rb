Rails.application.routes.draw do
  root to: 'subscriptions#index'
  get 'admin', to: "users#index"
  post 'user_role', to: "users#chief_role"
  resources :computers do
    resources :subscriptions
  end  
  resources :subscriptions do
    resources :confirmations
  end
  devise_for :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
