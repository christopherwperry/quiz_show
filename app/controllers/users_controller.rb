class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.all
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
    render 'show'
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def get_available_quizzes
    # @quizzes = Quiz.where.not(:published?: false, :user_id: params[:id])
  end
end
