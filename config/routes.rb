Rails.application.routes.draw do
  root 'static_pages#top'
  resources :questions do
    resources :answers
  end
end
