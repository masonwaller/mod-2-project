Rails.application.routes.draw do
  root :to => "sessions#welcome", :id => '1'
  resources :parks do
    resources :comments
  end

  resources :dogs
  resources :users
  resources :sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
