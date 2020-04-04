require "rails_helper"

RSpec.describe "Accounts", type: :request do
  describe "GET #new" do
    it "returns http success" do
      sign_in create(:user)
      get new_accounts_path

      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates an account with valid data" do
      sign_in create(:user)
      expect {
        post accounts_path, params: {account: attributes_for(:account)}
      }.to change { Account.count }.by(1)

      expect(response).to redirect_to root_path
    end

    it "doesn't create an account with invalid data" do
      sign_in create(:user)
      expect {
        post accounts_path, params: {account: attributes_for(:account, {name: nil})}
      }.to change { Account.count }.by(0)

      expect(response).not_to redirect_to root_path
    end
  end
end
