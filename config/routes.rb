Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profile'
    post 'profiles', to: 'users/registrations#create_profile'
  end
  root to: "spots#index"
  resources :spots do
    resources :reviews, only: [:show, :create]
  end
  resources :users, only: [:show, :update]
end
