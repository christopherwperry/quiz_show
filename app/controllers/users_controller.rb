class UsersController < ApplicationController
  before_action :current_user, only: [:destroy, :publish]

  def new
    @user = User.new
  end

  def index
    @users = User.all
    render 'index'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    if @user == current_user or current_user.is_admin?
      render 'show'
    else
      redirect_to users_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user == @current_user
      @user.destroy
      redirect_to '/'
    else
      redirect_to '/'
    end
  end



  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
