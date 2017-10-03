class QuizzesController < ApplicationController
  before_action :authenticate, only: [:create, :update, :destroy, :publish]
  before_action :get_user, only: [:create, :update, :publish]

  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def create
    if @user.is_admin?
      @quiz = Quiz.create(quiz_params)
      @quiz.user = @current_user
      if @quiz.save
        redirect_to users_path
      else
        render 'new'
      end
    else
      redirect_to quizzes_path
    end
  end

  def update
    @quiz = Quiz.find(params[:id])
    if !@quiz.published? && @quiz.user == @current_user
      @quiz.update!(quiz_params)
      redirect_to quiz_path
    else
      render 'edit'
    end
  end

  def publish
    @quiz = Quiz.find(params[:id])
    if !@quiz.published? && @quiz.user == @current_user
      @quiz.update!(quiz_params)
      # @quiz.published? == true
      @quiz.save!
      redirect_to quiz_path
    else
      render 'edit'
    end
  end

  def destroy
    @quiz = Quiz.find(params[:id])
    if @quiz.user == @current_user
      @quiz.destroy
      redirect_to users_path
    else
      render 'show'
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(:title, :total_points, :type, :published?)
  end

  def get_user
    @user = @current_user
  end

end
