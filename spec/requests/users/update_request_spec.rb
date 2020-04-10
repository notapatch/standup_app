require "rails_helper"

RSpec.describe "Users PUT #update", type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  it "redirects on update" do
    put account_user_path(id: user.id), params: {user: {email: "yay@example.com"}}

    expect(response).to redirect_to(account_users_path)
  end

  it "re-renders on failure" do
    put account_user_path(id: user.id), params: {user: {email: nil}}

    expect(response).to have_http_status(:success)
  end
end
