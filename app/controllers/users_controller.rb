class UsersController < ApplicationController
  def index
  end
  def new
    #create user view
    @user = User.new
  end
  def create
    @user = User.new()

  end

  private
  def user_params
    params.require(:user).permit(
      :username,
      :lastname,
      :email,
      :password,
      :password_confirmation
    )
  end
end
