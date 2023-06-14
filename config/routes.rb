Rails.application.routes.draw do

  root to: "tasks#index"

  resources :tasks do
    resources :subtasks, only: %i[create update destroy]
  end
end
