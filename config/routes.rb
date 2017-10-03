Rails.application.routes.draw do
  root to: 'sessions#new'
  resources :answers
  resources :questions
  resources :quizzes
  resources :users
  resource :session, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
