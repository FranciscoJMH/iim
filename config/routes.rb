Rails.application.routes.draw do
  resources :tools
  resources :machineries do
     member do
        get 'show_details/:id', to: 'machineries#show_details', as: 'show_details'
    end

    collection do
        get 'new_rent', to: 'machineries#new_rent', as: 'new_rent'
    end
 end

  resources :enterprises
  resources :responsibles
    devise_scope :user do
    devise_for :users, controllers: {
      registrations: 'users/registrations'
    }
    unauthenticated do
      root 'devise/sessions#new'
    end
    authenticated do
      root 'home#index', as: :authenticated_root
      resources :buys
      resources :articles
      resources :projects
      resources :providers
      resources :buy_articles
        end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
