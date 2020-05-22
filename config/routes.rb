Rails.application.routes.draw do

  devise_for :students
  get 'tasks/index'
  get 'tasks/show'
  get 'tasks/edit'
  get 'tasks/new'

  # get 'instructions/index'
  # get 'instructions/show'
  # get 'instructions/edit'
  # get 'instructions/new'

  devise_for :teachers

 root to: "projects#index"

  resources :projects do
    resources :tasks
    resources :instructions
    resources :materials
    resources :taskcomments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


