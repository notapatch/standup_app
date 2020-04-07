require "rails_helper"

RSpec.describe "Users GET #index", type: :request do
  let(:admin_account) { create(:admin_account) }
  let(:admin_account_with_users) { create(:admin_account_with_users) }

  it "returns http success" do
    sign_in admin_account

    get account_users_path

    expect(response).to have_http_status(:success)
  end

  it "lists users" do
    sign_in admin_account_with_users

    get account_users_path
    expect(response).to have_http_status(:success)
    admin_account_with_users.account.users.each do |user|
      expect(response.body).to include(user.name)
    end
  end
end
