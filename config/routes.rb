Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'devise/sessions', registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index show] do
    resources :posts do
      resources :comments, only: %i[new create]
      resources :likes, only: [:create]
    end
  end

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
    get 'users/sign_out' => 'devise/sessions#destroy'
  end


  # Defines the root path route ("/")
  root 'users#index'
end
