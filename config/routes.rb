Rails.application.routes.draw do
  root 'static_pages#top'
  resources :questions do
    resources :answers
  end

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create]
end
