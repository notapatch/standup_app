require "rails_helper"

RSpec.describe "Users DELETE #destroy", type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  it "redirects on delete" do
    delete account_user_path(id: user.id)

    expect(response).to redirect_to(account_users_path)
  end
end
