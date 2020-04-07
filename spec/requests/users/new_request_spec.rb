require "rails_helper"

RSpec.describe "Users GET #new", type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  it "returns http success" do
    get new_account_user_path

    expect(response).to have_http_status(:success)
  end
end
