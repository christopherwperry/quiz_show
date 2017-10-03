class QuizzesController < ApplicationController
  before_action :authenticate, only: [:create, :update, :destroy]

  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def create
    @Quiz = Quiz.create(quiz_params)
    @quiz.user = current_user
    if @quiz.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def update
    @quiz = Quiz.find(params[:id])
    if !@quiz.published? && @quiz.user == current_user
      @quiz.update!(quiz_params)
      redirect_to quizzes_path
    else
      render 'edit'
    end
  end

  def destroy
    @quiz = Quiz.find(params[:id])
    if @quiz.user == current_user
      @quiz.destroy
      redirect_to users_path
    else
      render 'show'
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(:title, :total_points, :type, :published)
  end

end
