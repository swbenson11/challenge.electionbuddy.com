Rails.application.routes.draw do
  resources :election_audit, only: [:index, :show]

  resources :elections do
    resources :questions, shallow: true do
      resources :answers, shallow: true
    end
    resources :voters, shallow: true do
      get :ballot, on: :member
      post :submit, on: :member
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
