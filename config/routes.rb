Rails.application.routes.draw do
  resources :pictures do
    collection do
      post :confirm
    end
  end
  root 'sessions#new'
  resources :users do
    member do
      get :favorites
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end
