Rails.application.routes.draw do
  resources :sampling_types
  resources :fase_types
  resources :operator_registers
  resources :activity_types
  resources :activities
  resources :paths
  resources :fases
  resources :samplings
  resources :colaborators
  resources :projects
  resources :positions
  resources :users
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => redirect("/admins/sign_in")

  post '/users/login/' => 'users#newlog'
  post '/users/signup/' => 'users#newuser'
  post '/users/finduser/' => 'users#finduser'

  post '/projects/newproject' => 'projects#newproject'
  post '/projects/userprojects' => 'projects#userprojects'

  post '/samplings/newsampling' => 'samplings#newsampling'
  post '/samplings/projectsamplings' => 'samplings#projectsamplings'

  get '/projects/mostrar/:usuario/:token' => 'comments#newmostrar'
end
