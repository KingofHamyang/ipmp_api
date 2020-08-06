Rails.application.routes.draw do
  resources :schools do
    resources :teams, shallow: true do
      resources :students do
        resources :users do
          resources :ucc_votes, only: [:index]
          resources :vr_votes, only: [:index]
        end
      end
      resources :uccs do
        member do
          post :voting
        end
        resources :ucc_votes, only: [:index, :show]
      end
      resources :vrs do
        member do
          post :voting
        end
        resources :vr_votes, only: [:index, :show]
      end
    end
  end

  resources :settings

  resources :notices

  resources :teams, only: [:index]
  resources :students, only: [:index]
  resources :users, only: [:index]

  resources :uccs, only: [:index]
  resources :ucc_votes, only: [:index]

  get '/get_ucc_by_keyword', to: 'uccs#get_by_keyword'
end
