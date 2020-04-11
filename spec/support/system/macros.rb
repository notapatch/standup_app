module SystemMacros
  def user_create_and_login
    user = FactoryBot.create(:user_account)
    user.add_role :user
    login_as(user, scope: :user)
    user
  end
end
