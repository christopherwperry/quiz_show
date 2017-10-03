Rails.application.routes.draw do
  resources :result_answers
  resources :result_quizzes
  root to: 'sessions#new'
  resource :session, only: [:new, :create, :destroy]
  resources :quizzes do
    post :publish
    resources :questions, only: [:create, :edit, :destroy, :show]  do
      resources :answers, only: [:create, :edit, :destroy]
    end
  end
  resources :users, except: [:index] do
    collection do
    end
  end

  # root 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
