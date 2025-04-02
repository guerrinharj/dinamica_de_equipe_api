Rails.application.routes.draw do
  namespace :api do
    resources :dinamicas do
      resources :reviews, only: [:create]
      collection do
        get :aleatoria
      end
    end

    get 'participantes', to: 'participantes#index'
  end
end
