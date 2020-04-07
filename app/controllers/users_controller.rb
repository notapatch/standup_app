class UsersController < ApplicationController
  before_action :set_users, only: [:index]

  def index
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_users
    @users = current_account.users
  end
end
