Rails.application.routes.draw do
  root 'questions#index'
  devise_for :users

  # resources :questions

  resources :questions do
    resources :answers, only: [:index, :new, :create]

  resources :answers, only: [:show]
  end
end
