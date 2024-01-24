Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/v1/auth', skip: [:omniauth_callbacks]
  
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  
  root to: 'home#index'

  api_version(module: 'V1', path: { value: 'api/v1' }) do
    post '/auth/sign_in', to: 'authentication#sign_in'
    resources :portfolios, only: [:index, :show] do
      member do
        get 'holdings'
        get 'returns'  
      end        
    end
    resources :trades, only: [:create, :update, :destroy]
  end
end
