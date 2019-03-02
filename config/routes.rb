Rails.application.routes.draw do
  root to: 'computers#index'
  resources :computers do
    resources :registrations
  end  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
