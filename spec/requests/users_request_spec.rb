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

  describe "GET #new" do
    it "returns http success" do
      get new_account_user_path

      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates a user" do
      expect {
        post account_users_path, params: {user: attributes_for(:user, {role: "user"})}
      }.to change { User.count }.by(1)

      expect(response).to redirect_to(account_users_path)
    end

    it "does not create user on invalid data" do
      expect {
        post account_users_path, params: {user: attributes_for(:user, {email: nil, role: "user"})}
      }.to change { User.count }.by(0)

      expect(response).to have_http_status(:success)
    end

    it "fails on non-unique email" do
      user = create(:user)
      expect {
        post account_users_path, params: {user: attributes_for(:user, {email: user.email, role: "user"})}
      }.to change { User.count }.by(0)

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get edit_account_user_path(create(:user))

      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    it "redirects on update" do
      user = create(:user)

      put account_user_path(id: user.id), params: {user: {email: "yay@example.com"}}
      expect(response).to redirect_to(account_users_path)
    end

    it "re-renders on failure" do
      user = create(:user)

      put account_user_path(id: user.id), params: {user: {email: nil}}
      expect(response).to have_http_status(:success)
    end
  end
end
