require "rails_helper"

RSpec.describe "Users", type: :request do
  let(:admin_account) { create(:admin_account) }
  let(:admin_account_with_users) { create(:admin_account_with_users) }

  before do
    sign_in admin_account
  end

  describe "GET #index" do
    it "returns http success" do
      get account_users_path

      expect(response).to have_http_status(:success)
    end

    it "lists users" do
      sign_out admin_account
      sign_in admin_account_with_users

      get account_users_path
      expect(response).to have_http_status(:success)
      admin_account_with_users.account.users.each do |user|
        expect(response.body).to include(user.name)
      end
    end
  end

  describe "GET #me" do
    it "returns http success" do
      get my_settings_path

      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update_me" do
    it "returns http success" do
      patch update_my_settings_path, params: {user: {name: "John"}}

      expect(response).to redirect_to my_settings_path
    end
  end

  describe "GET /new" do
    it "returns http success" do
      skip
      get "/users/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      skip
      get "/users/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      skip
      get "/users/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      skip
      get "/users/update"
      expect(response).to have_http_status(:success)
    end
  end
end
