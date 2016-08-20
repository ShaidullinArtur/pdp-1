Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  root to: "articles#index"

  resource :feedback, controller: "feedback", only: %i(new create)
  resource :about, controller: "about", only: :show

  resources :articles do
    resources :comments, module: :articles, only: :create
  end
end
