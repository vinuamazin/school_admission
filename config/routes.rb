Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/login', controller: :users, action: :login
  delete '/logout', controller: :users, action: :logout
  get '/sign_up', controller: :users, action: :sign_up

  root 'users#new'
  get 'welcomes/index'
  resources :teachers
  resources :students
  resources :standards
  resources :classrooms
  resources :addresses
  resources :attendances

  namespace :api do
    namespace :v1 do
      resources :students
      resources :districts
    end
  end

end
