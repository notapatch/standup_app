require "rails_helper"

RSpec.describe "Users PATCH #update_password", type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  it "succeeds with valid password" do
    patch my_update_password_path(id: user.id),
      params: {user: {password: "d2g4j6ml",
                      password_confirmation: "d2g4j6ml"}}

    expect(response).to redirect_to my_password_path
  end

  it "fails with invalid passwords" do
    patch my_update_password_path(id: user.id),
      params: {user: {password: "123",
                      password_confirmation: "123"}}

    expect(response).to have_http_status(:success)
  end
end
