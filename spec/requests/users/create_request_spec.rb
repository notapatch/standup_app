require "rails_helper"

RSpec.describe "Users POST #create", type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

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
    expect {
      post account_users_path, params: {user: attributes_for(:user, {email: user.email, role: "user"})}
    }.to change { User.count }.by(0)

    expect(response).to have_http_status(:success)
  end
end
