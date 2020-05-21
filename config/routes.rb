Rails.application.routes.draw do
  resources :instructions
  devise_for :students
  get 'tasks/index'
  get 'tasks/show'
  get 'tasks/edit'
  get 'tasks/new'
  devise_for :teachers

 root to: "projects#index"

  resources :projects do
    resources :tasks
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


