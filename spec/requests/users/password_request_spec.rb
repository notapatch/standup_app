require "rails_helper"

RSpec.describe "Users GET #password", type: :request do
  let(:admin_account) { create(:admin_account) }

  before do
    sign_in admin_account
  end

  it "returns http success" do
    get my_password_path

    expect(response).to have_http_status(:success)
  end
end
