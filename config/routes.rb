Rails.application.routes.draw do
  get 'home/index'

  resources :about, only: [:index]
  resources :terms, only: [:index]
  resources :articles, path_names: {:create => '/index'}
  resource :contacts, only: [:new, :create], path_names: {:new => ''}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
