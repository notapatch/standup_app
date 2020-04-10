require "rails_helper"

RSpec.describe "Users GET #edit", type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  it "returns http success" do
    get edit_account_user_path(user)

    expect(response).to have_http_status(:success)
  end
end
