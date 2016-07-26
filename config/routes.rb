Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  root to: "pages#home"

  resource :feedback, controller: "feedback", only: %i(new create)

  resources :articles do
    resources :comments, module: :articles, only: :create
  end
end
