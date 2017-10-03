Rails.application.routes.draw do
  resources :quizzes do
    resources :questions, only: [:create, :edit, :destroy]  do
      resources :answers, only: [:create, :edit, :destroy]
    end
  end
  resources :users, except: [:index] do
    collection do
      post :login
    end
  end

  # root 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
