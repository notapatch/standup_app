class UsersController < ApplicationController
  before_action :set_user, only: [:edit]
  before_action :set_users, only: [:index]

  def index
  end

  def new
    @user = User.new
    set_choices
  end

  def edit
    set_choices
  end

  def me
    @user = current_user
  end

  def update_me
    @user = current_user
    respond_to do |format|
      if @user.update(user_params)
        format.html {
          redirect_to my_settings_path,
            notice: "Your information was successfully updated."
        }
      else
        format.html { render :me }
      end
    end
  end

  def create
    @user = User.unscoped.new(user_params.except("role"))
    @user.account = current_account
    @user.password = "password123"

    respond_to do |format|
      if @user.valid? && @user.invite!(current_user)
        @user.add_role user_role, current_account
        format.html {
          redirect_to account_users_path,
            notice: "User was successfully invited."
        }
      else
        set_choices
        format.html { render :new }
      end
    rescue ActiveRecord::RecordNotUnique
      flash[:alert] = "Email must be unique"
      format.html { render :new }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_users
    @users = current_account.users
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_choices
    @choices = [["Admin", "admin"], ["User", "user"]]
  end

  def user_role
    (user_params[:role] || "user").to_sym
  end

  def user_params
    user_params_allowed = [:name, :email, :role, :time_zone]

    user_params_allowed << :role if current_user.has_role? :admin

    params.require(:user).permit(user_params_allowed)
  end
end
