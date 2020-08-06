Rails.application.routes.draw do
  resources :schools do
    resources :teams, shallow: true do
      resources :students do
        resources :users
      end
    end
  end

  resources :teams, only: [:index]
  resources :students, only: [:index]
  resources :users, only: [:index]
end
