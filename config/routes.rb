Rails.application.routes.draw do
  resources :spices, only: [:index, :update, :create, :destroy]
end
