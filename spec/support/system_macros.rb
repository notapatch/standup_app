module SystemMacros
  def login_user
    before do
      @user = FactoryBot.create(:user)
      @user.add_role :user
      login_as(@user, scope: :user)
    end
  end
end
