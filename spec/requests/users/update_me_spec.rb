require "rails_helper"

RSpec.describe "Users PUT #update_me", type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  it "returns http success" do
    patch update_my_settings_path, params: {user: {name: "John"}}

    expect(response).to redirect_to my_settings_path
  end
end
