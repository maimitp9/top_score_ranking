Rails.application.routes.draw do
  namespace :api do
    resources :scores, only: [:index, :show, :create, :destroy]
  end
end
