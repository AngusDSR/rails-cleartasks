Rails.application.routes.draw do
  root to: "tasks#index"

  resources :tasks do
    collection do
      get :completed
    end

    member do
      patch 'mark_complete'
    end

    resources :subtasks, only: %i[create update destroy]
  end
end
