Rails.application.routes.draw do
  root 'users#index'
  resources :users
  resources :questions
  get 'show' => 'users#show'
end
