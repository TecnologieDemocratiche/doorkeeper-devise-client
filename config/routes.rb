DoorkeeperDeviseClient::Application.routes.draw do
  get 'explore/:api' => 'api#explore', as: :explore_api
  devise_for :users, skip: [:sessions], controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new', as: :new_user_session
    get 'sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end

  root to: 'home#index'
end
