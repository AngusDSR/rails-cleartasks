Rails.application.routes.draw do
  root to: "tasks#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :tasks do
    resources :subtasks, only: %i[new update destroy]
  end
end
