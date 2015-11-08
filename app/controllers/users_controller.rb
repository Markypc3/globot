class UsersController < ApplicationController
  def index
  end
  def show
    @user = User.find(params[:id])
  end
  def new
    #create user view
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/'
    else
      render :new
    end
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    binding.pry
    @user = User.find(params[:id])
    if @user == current_user && @user.update(user_params)
      redirect_to "/users/#{params[:id]}"
    else
      render :edit
    end
  end
  def destroy
    @user = User.find(params[:id])
    if @user == User.find(current_user.id)
      @user.destroy
      redirect_to logout_path
    else
      session[:return_to] ||= request.referer
      redirect_to session.delete(:return_to)
    end
  end
  private
  def user_params
    params.require(:user).permit(
      :username,
      :firstname,
      :lastname,
      :email,
      :password,
      :password_confirmation
    )
  end
end
