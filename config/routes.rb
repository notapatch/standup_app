Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}
  resource :accounts

  get "user/me", to: "users#me", as: "my_settings"
  patch "users/update_me", to: "users#update_me", as: "update_my_settings"

  scope "account", as: "account" do
    resources :users
  end

  get "activity/mine"
  get "activity/feed"

  root to: "activity#mine"
end
