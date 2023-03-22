Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "api/v1/resumes#index"
  namespace :api do
    namespace :v1 do
      resources :resumes do
        resources :educations, only: [:index, :create, :update, :destroy]
        resources :experiences, only: [:index, :create, :update, :destroy]
      end
    end
  end
end
