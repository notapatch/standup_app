class UsersController < ApplicationController
  before_action :set_users, only: [:index]

  def index
  end

  def me
    @user = current_user
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_users
    @users = current_account.users
  end
end
