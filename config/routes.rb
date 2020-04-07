Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}
  resource :accounts

  scope "account", as: "account" do
    resources :users
  end

  get "activity/mine"
  get "activity/feed"

  root to: "activity#mine"
end
