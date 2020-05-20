Rails.application.routes.draw do
  get 'tasks/index'
  get 'tasks/show'
  get 'tasks/edit'
  get 'tasks/new'
  devise_for :teachers
  devise_for :users
  resources :projects do
    resources :tasks
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


