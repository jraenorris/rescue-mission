Rails.application.routes.draw do
  root 'questions#index'
  devise_for :users
  
  resources :questions do
    resources :answers, only: [:index, :new, :create]
  end
end
