Rails.application.routes.draw do
  namespace :admin do
    get "invitations/new"
    get "invitations/create"
  end
  devise_for :users
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  scope "(:locale)", locale: /#{I18n.available_locales.join('|')}/, defaults: { locale: "ka" } do
    root "home#index"
    namespace :admin do
      root to: "words#index"
      resources :invitations, only: [ :new, :create ]
      resources :words
      resources :other_qualifications
    end
  end
end
