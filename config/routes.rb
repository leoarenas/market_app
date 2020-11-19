Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    delete '/users/sign_out' => 'devise/sessions#destroy'
    post '/users/sign_up' => 'devise/registrations#new'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :categorium
  resources :clients
end
