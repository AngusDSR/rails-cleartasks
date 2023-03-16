Rails.application.routes.draw do
  root to: "tasks#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :tasks
end
