Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"

  resources :articles do
    resources :comments, module: :articles, only: :create
  end
end
