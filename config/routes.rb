Rails.application.routes.draw do
  root to: "tasks#index"

  resources :tasks do
    member do
      patch 'mark_complete'
    end

    resources :subtasks, only: %i[create update destroy]
  end
end
