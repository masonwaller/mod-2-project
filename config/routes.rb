Rails.application.routes.draw do
  resources :parks do
    resources :comments
  end
  root :to => "sessions#welcome", :id => '1'
  resources :dogs
  resources :users
  resources :sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
