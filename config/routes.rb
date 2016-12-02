Rails.application.routes.draw do
  
  devise_for :users, controllers: { 
    sessions: 'users/sessions', 
    registrations: 'users/registrations', 
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
    omniauth_callbacks: 'users/omniauth_callbacks' 
  }
  
  unauthenticated do
    root 'home#index'
  end

  authenticate :user do
    root 'home#test'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
