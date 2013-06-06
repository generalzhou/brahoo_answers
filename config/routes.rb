BrahooAnswers::Application.routes.draw do
  # Questions
  resources :questions

  # Answers
  resources :answers,  :only => [:create, :edit, :destroy]

  # Comments
  resources :comments, :only => [:create, :edit, :destroy]

  # Users
  resources :users
  match '/signup' => 'users#new'

  # Sessions
  get    '/login'  => 'sessions#new'
  post   '/login'  => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  # Tags
  resources :tags, :only => [:show, :index]

  # Votes
  resources :votes, :only => [:create]

  # Root
  root :to => 'questions#index'
end
