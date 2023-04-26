Rails.application.routes.draw do
  get 'subtasks/new'
  get 'subtasks/destroy'
  root to: "tasks#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :tasks do
    resources :subtasks
  end
end
