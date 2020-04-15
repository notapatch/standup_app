module SystemMacros
  def user_create_and_login
    user = FactoryBot.create(:user_account)
    user.add_role :user
    login_as(user, scope: :user)
    user
  end

  def admin_create_and_login
    admin = FactoryBot.create(:admin_account)
    admin.add_role :admin
    login_as(admin, scope: :user)
    admin
  end
end
