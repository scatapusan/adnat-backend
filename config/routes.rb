Rails.application.routes.draw do
  root to: 'organisations#index'
  #get 'shift/index'
  #get 'shift/new'
  #get 'shift/create'
  #get 'shift/show'
  #get 'shift/edit'
  # get 'shift/destroy'
  #get 'user/index'
  ##get 'user/edit'
  #get 'organisations/index'
  # get 'organisations/new'
  #get 'organisations/create'
  #  get 'organisations/show'
  # get 'organisations/edit'
  # get 'organisations/update'
  # get 'organisations/destroy'

  resources :organisations
  resources :shifts
  resources :users, only: [:edit]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
