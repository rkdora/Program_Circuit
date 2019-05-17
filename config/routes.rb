Rails.application.routes.draw do
  root 'times#index'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources 'users'
  resources 'codes'
  resources 'times'
end
