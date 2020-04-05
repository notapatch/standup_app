require "rails_helper"

RSpec.describe "SignInProcesses", type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:password) { "123456" }
  let(:user) { create(:user, {password: password, password_confirmation: password}) }

  it "should require the user log and successfully logs in" do
    visit root_path

    within "#new_user" do
      fill_in "user_email", with: user.email
      fill_in "user_password", with: password
    end

    click_button "Sign In"

    expect(page).to have_current_path(root_path)
  end

  it "should fail on an invalid user" do
    visit root_path

    within "#new_user" do
      fill_in "user_email", with: "test"
      fill_in "user_password", with: "password"
    end

    click_button "Sign In"

    expect(page).to have_current_path(new_user_session_path)
  end
end
