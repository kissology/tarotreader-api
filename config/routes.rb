Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Session Routes
  post '/login', to: 'sessions#create'      # Login (start session)
  delete '/logout', to: 'sessions#destroy'   # Logout (end session)
  get '/me', to: 'sessions#me'                # Check current session (who is logged in)
  get '/session_time_remaining', to: 'sessions#time_remaining'  # Check time remaining in session

  # Other routes (if needed for users, etc.)
  resources :users, only: [:index, :show, :create, :update, :destroy]

end
