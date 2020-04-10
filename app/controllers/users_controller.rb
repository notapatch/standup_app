class UsersController < ApplicationController
  before_action :set_users, only: [:index]

  def index
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

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_users
    @users = current_account.users
  end

  def user_params
    params.require(:user).permit(:name, :email, :time_zone)
  end
end
