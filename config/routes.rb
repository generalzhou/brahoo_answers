BrahooAnswers::Application.routes.draw do
  # Questions
  resources :questions

  # Users
  resources :users
  match '/signup' => 'users#new'

  # Sessions
  get    '/login'  => 'sessions#new'
  post   '/login'  => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  # Root
  root :to => 'questions#index'
end
